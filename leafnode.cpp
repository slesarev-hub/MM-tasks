#include "leafnode.h"

namespace b_plus_tree{

LeafNode::LeafNode()
    : Node(){}

LeafNode::LeafNode(int tree_parameter)
    : Node(tree_parameter){}

//LeafNode::LeafNode(Node& parent)
//    : Node(parent.tree_parameter), parent(std::make_shared<Node>(parent)){}

//LeafNode::LeafNode(std::shared_ptr<Node> parent)
//    : Node(parent->tree_parameter), parent(parent){}

LeafNode::~LeafNode(){}

};
