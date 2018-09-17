#include "binary_tree.h"

#include <fstream>
#include <iostream>

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

using namespace testing;

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

Node* read_tree(std::ifstream& in) {
    int nodes_count  = 0;
    int current_data = 0;

    in >> nodes_count;
    in >> current_data;
    Node* root         = new Node(current_data);
    Node* current_node = nullptr;
    for (int i = 0; i < nodes_count - 1; i++) {
        in >> current_data;;
        current_node = new Node(current_data);
        root->insert(current_node);
    }

    return root;
}

void read_and_run_traversal(std::string test_dir) {
    std::ifstream in(test_dir);
    std::cout << "stream status: " << in.is_open() << "\n";
    Node* root = read_tree(in);
    std::cout << "direct_order_traversal: ";
    root->direct_order_traversal_print();
    std::cout << "\ndirect_order_traversal: ";
    root->direct_order_traversal_print();
    std::cout << "\n";
    root->levelOrderPrint();
    delete_all_tree(root);
    in.close();
}

TEST(traversal, 0_0) {
    read_and_run_traversal("./test_0_0");
}

void read_and_run_insert_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    std::cout << "stream status: " << in.is_open() << "\n";
    Node* root = read_tree(in);
    root->print();
    delete_all_tree(root);
    in.close();
}
/*
TEST(insert, 1_1) {
    read_and_run_insert_tests("./test_1_1");
}

TEST(insert, 1_2) {
    read_and_run_insert_tests("./test_1_2");
}

TEST(insert, 1_3) {
    read_and_run_insert_tests("./test_1_3");
}
*/
void read_and_run_erase_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    int operations_count = 0;
    in >> operations_count;
    Node* tree = read_tree(in);
    for (int i = 0; i < operations_count; i++)
    {
        int key = 0;
        in >> key;

        tree->erase(key);

        tree->print();
        std::cout << "\n----" << key << "----"<< i << "----\n";
        Node* correct_tree = read_tree(in);
        correct_tree->print();
        std::cout << "\n\n";
        compare_trees(correct_tree, tree);
        delete correct_tree;
    }
    in.close();
}

TEST(insert, 2_1) {
    read_and_run_erase_tests("./test_2_1");
}

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
