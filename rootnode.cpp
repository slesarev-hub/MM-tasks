#include "rootnode.h"

namespace b_plus_tree{

RootNode::RootNode()
    : Node(), source(VectDataP()){}

RootNode::RootNode(int tree_parameter)
    : Node(tree_parameter), source(VectDataP()){}

RootNode::~RootNode(){}

void RootNode::rebuilding_insert(DataP data){}

}
