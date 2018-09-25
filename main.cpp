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

void read_and_run_traversal(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count   = 0;
    int currecnt_data = 0;

    std::cout << "stream status: " << in.is_open() << "\n";
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
    read_and_run_traversal("./test_0_0");
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
/*
void read_and_run_bulk_load_test(std::string test_dir) {
    std::ifstream in(test_dir);
    size_t nodes_count = 0;
    int currecnt_data  = 0;
    in >> nodes_count;
    std::vector<Data> input_nodes(nodes_count, Data(0));

    for (size_t i = 0; i < nodes_count; i++)
    {
        in >> currecnt_data;
        input_nodes[i].set(currecnt_data);
    }
    Node* tree = bulk_load(input_nodes);
    tree->print();
    delete_all_tree(tree);
}

TEST(bulk_load, 2_0) {
    read_and_run_bulk_load_test("./test_2_0");
}

TEST(bulk_load, 2_1) {
    read_and_run_bulk_load_test("./test_2_1");
}
*/
/*
TEST(bulk_load, 2_2) {
    read_and_run_bulk_load_test("./test_2_2");
}
*/

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
