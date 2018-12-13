#include "tree.h"

namespace b_plus_tree
{
Tree::Tree()
    : insert_parameter(1), delete_parameter(1), depth(0), root(std::make_shared<RootNode>(RootNode())){}

Tree::Tree(int tree_parameter, int insert_parameter, int delete_parameter)
    : insert_parameter(insert_parameter), delete_parameter(delete_parameter), depth(0), root(std::make_shared<RootNode>(RootNode(tree_parameter))){}

Tree::~Tree(){}

void Tree::rebuilding_insert(DataP data){
    rebuilder<RootP,DataP>(this->root,data);

    /*auto* keys = &this->root->keys;
    auto  it   = std::lower_bound(keys->begin(), keys->end(), data->key);
    if ((it != keys->end()) && (*it == data->key))
    {
        std::cerr << "error: Tree::rebuilding_insert: key " << data->key << " already exists\n";
    }
    int   t           = this->root->tree_parameter;
    int   idx         = static_cast<int>(it - keys->begin());

    if (std::holds_alternative<VectDataP>(this->root->source))
    {
        auto* root_source = &std::get<VectDataP>(this->root->source);
        keys->insert(it, data->key);
        root_source->insert(root_source->begin() + idx, data);

        if (static_cast<int>(keys->size()) == this->root->size_up_border)
        {
            auto left_node    = std::make_shared<LeafNode>(LeafNode(t));
            auto right_node   = std::make_shared<LeafNode>(LeafNode(t));

            left_node->source  = VectDataP();
            right_node->source = VectDataP();
            std::move(std::move(root_source->begin(),
                                root_source->begin() + t,
                                left_node->source.begin()),
                      root_source->end(),
                      right_node->source.begin());
            root_source->clear();

            this->root->source = VectLeafP();
            auto* root_source  = &std::get<VectLeafP>(this->root->source);
            root_source->push_back(left_node);
            root_source->push_back(right_node);

            std::move(std::move(keys->begin(),
                                keys->begin() + t,
                                left_node->keys.begin()),
                      keys->end(),
                      right_node->keys.begin());
            keys->clear();
            keys->push_back(right_node->keys[0]);
            this->depth++;
        }
    }
    else if (std::holds_alternative<VectLeafP>(this->root->source))
    {
        auto* root_source = &std::get<VectLeafP>(this->root->source);
        rebuilding_insert<RootP,DataP>(root_source->at(idx),data);
        //root_source->at(idx)->rebuilding_insert(data);
    }
    else if (std::holds_alternative<VectInnerP>(this->root->source))
    {
        auto* root_source = &std::get<VectInnerP>(this->root->source);
        rebuilding_insert(root_source->at(idx),data);
        //root_source->at(idx)->rebuilding_insert(data);
    }
    */

}

std::ostream& operator<<(std::ostream& os, const Tree& t)
{
    os << "depth: " << t.depth
       << " tree parameter: " << t.root->tree_parameter
       << " insert parameter: " << t.insert_parameter
       << " delete parameter: " << t.delete_parameter
       << "\n";
    print<RootP>(t.root,os,0);
    return os;
}


}
