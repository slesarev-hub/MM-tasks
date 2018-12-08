#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include "tree.h"

using namespace b_plus_tree;

TEST(constructors, 1){
    Tree t;
    std::cout << t;
    DataP a = std::make_shared<Data>(Data(1,"a"));
    t.rebuilding_insert(a);
    std::vector<DataP> f;
    std::cout << typeid(f).name() << "\n";
    std::cout << t;
}

