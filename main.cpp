#include "binary_tree.h"

#include <fstream>
#include <iostream>

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

using namespace binary_tree;

void compare_trees(Node* tree_1, Node* tree_2) {
    ASSERT_EQ(tree_1->get_data_value(), tree_2->get_data_value());
    if ((tree_1->get_left() != nullptr) && (tree_2->get_left() != nullptr)) {
        compare_trees(tree_1->get_left(), tree_2->get_left());
    }
    else if ((tree_1->get_left() != nullptr) || (tree_2->get_left() != nullptr))
    {
        std::cout << tree_1->get_left() << tree_2->get_left() << "\n\n";
        FAIL();
    }
    if ((tree_1->get_right() != nullptr) && (tree_2->get_right() != nullptr)) {
        compare_trees(tree_1->get_right(), tree_2->get_right());
    }
    else if ((tree_1->get_right() != nullptr) || (tree_2->get_right() != nullptr))
    {
        FAIL();
    }
}

void compare_data_vectors(std::vector<Data> data_1, std::vector<Data> data_2) {
    ASSERT_EQ(data_1.size(), data_2.size());
    for (size_t i = 0; i < data_1.size(); i++)
    {
        ASSERT_EQ(data_1[i].get(),data_2[i].get());
    }
}

Node* read_tree(std::ifstream& in, size_t& nodes_count) {
    int current_data = 0;
    in >> nodes_count;
    try
    {
        if (nodes_count == 0)
        {
            throw "empty tree";
        }
    }
    catch (...)
    {
        return new Node();
    }
    in >> current_data;
    Node* root = new Node(current_data);
    for (size_t i = 0; i < nodes_count - 1; i++) {
        in >> current_data;
        root->insert(new Node(current_data));
    }
    return root;
}

void read_and_run_traversal_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count   = 0;
    int currecnt_data = 0;

    //read tree
    Node* root = read_tree(in, nodes_count);

    std::vector<Data> direct_order_elements(nodes_count, Data(0));
    for (size_t i = 0; i < nodes_count; i++)
    {
        in >> currecnt_data;
        direct_order_elements[i].set(currecnt_data);
    }
    std::cout << "direct_order_traversal: ";
    compare_data_vectors(direct_order_elements, root->direct_order_traversal());
    root->direct_order_traversal_print();

    std::vector<Data> level_order_elements(nodes_count, Data(0));
    for (size_t i = 0; i < nodes_count; i++)
    {
        in >> currecnt_data;
        level_order_elements[i].set(currecnt_data);
    }
    std::cout << "\nlevel_order_traversal: ";
    compare_data_vectors(level_order_elements, root->level_order_traversal());
    root->level_order_traversal_print();
    std::cout << "\n";
    delete_all_tree(root);
    in.close();
}

TEST(traversal, 0_0) {
    read_and_run_traversal_tests("./test_0_0");
}

void read_and_run_erase_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count   = 0;
    int operations_count = 0;
    in >> operations_count;

    Node* tree = read_tree(in, nodes_count);
    tree->print();
    std::cout << "\n";
    for (int i = 0; i < operations_count; i++)
    {
        int key = 0;
        in >> key;
        tree->erase(key);
        tree->print();
        std::cout << "\n";
        Node* correct_tree = read_tree(in, nodes_count);
        compare_trees(correct_tree, tree);
        delete_all_tree(correct_tree);
    }
    delete_all_tree(tree);
    in.close();
}

TEST(erase, 1_0) {
    read_and_run_erase_tests("./test_1_0");
}

TEST(erase, 1_1) {
    read_and_run_erase_tests("./test_1_1");
}

TEST(erase, 1_2) {
    read_and_run_erase_tests("./test_1_2");
}

void read_and_run_insert_sequence_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count = 0;
    //read tree
    Node* tree = read_tree(in, nodes_count);

    //read path to node
    Node* node = tree;
    int path_length = 0;
    int way = -1;
    in >> path_length;
    if (path_length != 0)
    {
        for (int i = 0; i < path_length - 1; i++)
        {
            in >> way;
            if (way == 0)
            {
                node = node->get_left();
            }
            if (way == 1)
            {
                node = node->get_right();
            }
        }
        in >> way;
        if (way == 0)
        {
            node->set_left(new Node());
            node = node->get_left();
        }
        if (way == 1)
        {
            node->set_right(new Node());
            node = node->get_right();
        }
    }

    //read elements
    int elements_count = 0;
    in >> elements_count;

    std::vector<Data> sequence(0);
    for (int i = 0; i < elements_count; i++)
    {
        int current_value;
        in >> current_value;
        sequence.push_back(Data(current_value));
    }

    //read bounds
    int left_bound = -1;
    int right_bound = -1;
    in >> left_bound >> right_bound;

    //apply
    insert_sequence(node, sequence.begin() ,left_bound, right_bound);
    tree->print();

    //read correct tree
    Node* correct_tree = read_tree(in, nodes_count);
    compare_trees(correct_tree, tree);
}

TEST(insert_sequence, 2_0) {
    read_and_run_insert_sequence_tests("./test_2_0");
}

TEST(insert_sequence, 2_1) {
    read_and_run_insert_sequence_tests("./test_2_1");
}

TEST(insert_sequence, 2_2) {
    read_and_run_insert_sequence_tests("./test_2_2");
}

TEST(insert_sequence, 2_3) {
    read_and_run_insert_sequence_tests("./test_2_3");
}

void read_and_run_find_node_to_load_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count = 0;
    //read tree
    Node* tree = read_tree(in, nodes_count);

    //read elements
    int elements_count = 0;
    in >> elements_count;

    std::vector<Data> sequence(0);
    for (int i = 0; i < elements_count; i++)
    {
        int current_value;
        in >> current_value;
        sequence.push_back(Data(current_value));
    }

    //read bounds
    int bound = -1;
    in >> bound;
    std::vector<Data>::iterator ll = sequence.begin() + bound;
    in >> bound;
    std::vector<Data>::iterator lr = sequence.begin() + bound;
    in >> bound;
    std::vector<Data>::iterator rl = sequence.begin() + bound;
    in >> bound;
    std::vector<Data>::iterator rr = sequence.begin() + bound;

    //apply
    find_node_to_load(tree, sequence.begin(), ll, lr, rl, rr);
    tree->print();

    //read correct tree
    Node* correct_tree = read_tree(in, nodes_count);
    compare_trees(correct_tree, tree);
}

TEST(find_node_to_load, 3_0) {
    read_and_run_find_node_to_load_tests("./test_3_0");
}

TEST(find_node_to_load, 3_1) {
    read_and_run_find_node_to_load_tests("./test_3_1");
}

void read_and_run_bulk_load_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count = 0;
    //read tree
    Node* tree = read_tree(in, nodes_count);

    //read elements
    int elements_count = 0;
    in >> elements_count;

    std::vector<Data> sequence(0);
    for (int i = 0; i < elements_count; i++)
    {
        int current_value;
        in >> current_value;
        sequence.push_back(Data(current_value));
    }

    //apply
    bulk_load(tree, sequence);
    tree->print();

    //read correct tree
    Node* correct_tree = read_tree(in, nodes_count);
    compare_trees(correct_tree, tree);
}

TEST(bulk_load, 4_0) {
    read_and_run_bulk_load_tests("./test_4_0");
}

TEST(bulk_load, 4_1) {
    read_and_run_bulk_load_tests("./test_4_1");
}

TEST(bulk_load, 4_2) {
    read_and_run_bulk_load_tests("./test_4_2");
}

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
