#include "binary_tree.h"

#include <fstream>
#include <iostream>

#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

using namespace testing;

void compare_trees(Node* tree_1, Node* tree_2) {
    ASSERT_EQ(tree_1->get_data_value(), tree_2->get_data_value());
    if ((tree_1->get_left() != nullptr) && (tree_2->get_left())) {
        compare_trees(tree_1->get_left(), tree_2->get_left());
    }
    else{
        FAIL();
    }
    if ((tree_1->get_right() != nullptr) && (tree_2->get_right())) {
        compare_trees(tree_1->get_right(), tree_2->get_right());
    }
    else{
        FAIL();
    }

}

void read_and_run_insert_tests(std::string test_dir) {
    std::ifstream in(test_dir);
    std::cout << "stream status: " << in.is_open() << "\n";
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
    root->print();
    delete_all_tree(root);
}

TEST(insert, 1_1) {
    read_and_run_insert_tests("./test_1_1");
}

TEST(insert, 1_2) {
    read_and_run_insert_tests("./test_1_2");
}

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
