#include "innernode.h"

namespace b_plus_tree{

InnerNode::InnerNode()
    : Node(){}

InnerNode::InnerNode(int tree_parameter)
    : Node(tree_parameter){}

//InnerNode::InnerNode(Node& parent)
//    : Node(parent.tree_parameter), parent(std::make_shared<Node>(parent)){}

//InnerNode::InnerNode(std::shared_ptr<Node> parent)
//    : Node(parent->tree_parameter), parent(parent){}

InnerNode::~InnerNode(){}

void print(std::ostream& os, int space_counter){

}

};
