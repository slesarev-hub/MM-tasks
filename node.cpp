#include "node.h"

#include <iostream>

namespace b_plus_tree
{

Node::Node()
    : tree_parameter(2){}

Node::Node(int tree_parameter)
    : tree_parameter(tree_parameter){}

Node::~Node(){}

void Node::rebuilding_insert(Data& data){
    std::cout << "1\n";
}

void print(std::ostream& os, int space_counter){

}

}
