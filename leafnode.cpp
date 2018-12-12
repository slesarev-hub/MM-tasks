#include "leafnode.h"

namespace b_plus_tree{

LeafNode::LeafNode()
    : Node(){}

LeafNode::LeafNode(int tree_parameter)
    : Node(tree_parameter){}

LeafNode::~LeafNode(){}

void LeafNode::rebuilding_insert(DataP data){
    auto it = std::lower_bound(this->keys.begin(), this->keys.end(), data->key);
    if ((it != keys.end()) && (*it == data->key))
    {
        std::cerr << "error: LeafNode::rebuilding_insert: key " << data->key << " already exists\n";
    }
    int idx = static_cast<int>(it - keys.begin());
    this->keys.insert(it, data->key);
    this->source.insert(this->source.begin() + idx, data);
    if (static_cast<int>(this->keys.size()) == this->size_up_border)
    {
        this->parent.
    }
}

}
