#include "rootnode.h"

namespace b_plus_tree{

RootNode::RootNode()
    : Node(), source(std::vector<std::unique_ptr<Data>>()){}

RootNode::RootNode(int tree_parameter)
    : Node(tree_parameter), source(std::vector<std::unique_ptr<Data>>()){}

RootNode::~RootNode(){}

void print(std::ostream& os, int space_counter){

}

};
