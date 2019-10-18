#include "node.h"

#include <iostream>

namespace b_plus_tree
{


Node::Node()
    : tree_parameter(1)/*, keys({min_key,max_key})*/{}

Node::Node(int tree_parameter)
    : tree_parameter(tree_parameter)/*, keys({min_key,max_key})*/{}

Node::~Node(){}

//void Node::rebuilding_insert(DataP data){}

}
