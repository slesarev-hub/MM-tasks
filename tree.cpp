#include "tree.h"
#include "innernode.h"
#include "leafnode.h"
#include "rootnode.h"

namespace b_plus_tree
{
Tree::Tree()
    : insert_parameter(1), delete_parameter(1), depth(0){}

Tree::Tree(int tree_parameter, int insert_parameter, int delete_parameter)
    : insert_parameter(insert_parameter), delete_parameter(delete_parameter), depth(0), root(std::make_shared<RootNode>(RootNode(tree_parameter))){}

Tree::~Tree(){}

void Tree::rebuilding_insert(std::unique_ptr<Data> data){
    if (this->depth == 0)
    {
        auto  keys        = this->root->keys;
        auto  it          = std::lower_bound(keys.begin(), keys.end(), data->key);
        int   t           = this->root->tree_parameter;
        auto* root_source = &std::get<std::vector<std::unique_ptr<Data>>>(this->root->source);

        if (*it == data->key)
        {
            std::cerr << "error: Tree::rebuilding_insert - key " << data->key << " already exists\n";
        }
        keys.insert(it, data->key);
        int idx = static_cast<int>(it - keys.begin() - 1);
        root_source->insert(root_source->begin() + idx, data);

        if (keys.size() == this->root->size_up_border)
        {
            auto left_node    = std::make_shared<LeafNode>(LeafNode(t));
            auto right_node   = std::make_shared<LeafNode>(LeafNode(t));

            auto left_source  = std::vector<std::unique_ptr<Data>>();
            auto right_source = std::vector<std::unique_ptr<Data>>();
            std::move(std::move(root_source->begin(),
                                root_source->begin() + t,
                                left_source.begin()),
                      root_source->end(),
                      right_source.begin());
            root_source->clear();
            left_node->source  = left_source;
            right_node->source = right_source;

            this->root->source = std::vector<std::shared_ptr<LeafNode>>();
            auto* root_source  = &std::get<std::vector<std::shared_ptr<LeafNode>>>(this->root->source);
            root_source->push_back(left_node);
            root_source->push_back(right_node);

            std::move(std::move(keys.begin(),
                                keys.begin() + t,
                                left_node->keys.begin()),
                      keys.end(),
                      right_node->keys.begin());
            keys.clear();
            keys.push_back(right_node->keys[0]);
            this->depth++;
        }
    }
}

std::ostream& operator<<(std::ostream& os, const Tree& t)
{
    os << "depth: " << t.depth << " tree parameter: " << t.root->tree_parameter
       << " insert parameter: " << t.insert_parameter << " delete parameter: " << t.delete_parameter
       << "\n";
    t.root->print(os, 0);
    return os;
}


};
