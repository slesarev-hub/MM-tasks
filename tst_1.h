#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include "node.h"

using namespace b_plus_tree;

TEST(constructors, 1){
    Node<int> n1();
    std::vector<std::vector<std::unique_ptr<Data<int>>>> a();
    n1.nodes{std::vector<std::vector<std::unique_ptr<Data<int>>>>};
    n1.nodes.push_back(std::make_unique<Data<int>>(new Data<int>(1)))
}

