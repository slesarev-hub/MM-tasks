#include "rootnode.h"

namespace b_plus_tree{

RootNode::RootNode()
    : Node(), source(std::vector<DataP>()){}

RootNode::RootNode(int tree_parameter)
    : Node(tree_parameter), source(std::vector<DataP>()){}

RootNode::~RootNode(){}

};
