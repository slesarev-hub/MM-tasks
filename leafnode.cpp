#include "leafnode.h"

namespace b_plus_tree{

LeafNode::LeafNode()
    : Node(){}

LeafNode::LeafNode(int tree_parameter)
    : Node(tree_parameter){}

LeafNode::~LeafNode(){}

/*void LeafNode::rebuilding_insert(DataP data){
    auto it = std::lower_bound(this->keys.begin(), this->keys.end(), data->key);
    if ((it != keys.end()) && (*it == data->key))
    {
        std::cerr << "error: LeafNode::rebuilding_insert: key " << data->key << " already exists\n";
    }
    int idx = static_cast<int>(it - keys.begin());
    int t   = this->tree_parameter;
    this->keys.insert(it, data->key);
    this->source.insert(this->source.begin() + idx, data);
    if (static_cast<int>(this->keys.size()) == this->size_up_border)
    {
        auto new_node    = std::make_shared<LeafNode>(LeafNode(t));
        new_node->source = VectDataP();
        std::move(this->source.begin() + t,
                  this->source.end(),
                  new_node->source.begin());
        this->source.shrink_to_fit();

        std::move(this->keys.begin() + t,
                  this->keys.end(),
                  new_node->keys.begin());
        this->keys.shrink_to_fit();
        if (std::holds_alternative<RootP>(this->parent))
        {
            split<RootP,LeafP>(this->parent,new_node);
        }
        else
        {
            split<InnerP,InnerP>(this->parent,new_node);
        }
    }
}*/

}
