#include <gtest/gtest.h>
#include <gmock/gmock-matchers.h>

#include "tree.h"

using namespace b_plus_tree;

TEST(constructors, 1){
    Tree t(1,1,1);
    DataP a2 = std::make_shared<Data>(Data(2,"a2"));
    t.rebuilding_insert(a2);
    std::cout << t;
    DataP a1 = std::make_shared<Data>(Data(1,"a1"));
    t.rebuilding_insert(a1);
    std::cout << t;
    DataP a3 = std::make_shared<Data>(Data(3,"a3"));
    t.rebuilding_insert(a3);
    std::cout << t;
}

