#ifndef TREE_H
#define TREE_H

#include "innernode.h"
#include "leafnode.h"
#include "rootnode.h"

namespace b_plus_tree{

class Tree
{
public:
    Tree();
    Tree(int tree_parameter, int insert_parameter, int delete_parameter);
    ~Tree();

    void rebuilding_insert(std::shared_ptr<Data>);

    friend std::ostream& operator<<(std::ostream& os, const Tree& t);

    int                  insert_parameter;
    int                  delete_parameter;
    int                  depth;

    RootP                root;
    std::map<int, DataP> deferred_insert;
    std::vector<int>     deferred_delete;
};

template<typename T, typename VariantT>
struct is_variant_member;

template<typename T, typename... AlternativeT>
struct is_variant_member<T, std::variant<AlternativeT...>>
  : public std::disjunction<std::is_same<T, AlternativeT>...> {};

template<typename T, typename... AlternativeT>
constexpr bool is_variant_member_v = is_variant_member<T, AlternativeT...>::value;

template<typename NodeT, typename AlternativeT>
void print_node(NodeT node, std::ostream& os, size_t space_counter, std::string message);

template<typename NodeT, typename = std::enable_if<std::is_same_v<NodeT,RootP> || std::is_same_v<NodeT,InnerP> || std::is_same_v<NodeT,LeafP>>>
void print(NodeT node, std::ostream& os, size_t space_counter){
    auto space = std::string(space_counter, ' ');
    //os << space + "+inf\n";

    using VariantT = decltype(node->source);
    if constexpr (std::is_same_v<VectDataP,VariantT>)
    {
        if (node->source.size() > 0)
        {
            std::for_each(node->source.begin(), node->source.end(),
                          [&](DataP data){
                          os << space + std::to_string(data->key) + " " + data->source + "\n";});
        }
        else
        {
            std::cerr << "error: print: empty vector<DataP>\n";
        }
        //print_data(node->source, os, space_counter);
    }
    else if constexpr (is_variant_member_v<VectDataP,VariantT>)
    {
        print_node<NodeT,DataP>(node, os, space_counter, "DataP");
    }
    else if constexpr (is_variant_member_v<VectLeafP,VariantT>)
    {
        print_node<NodeT,LeafP>(node, os, space_counter, "LeafP");
        /*if (std::holds_alternative<VectLeafP>(node->source))
        {
            auto* source = &std::get<VectLeafP>(node->source);
            if ((source->size() > 0) && (node->keys.size() > 0))
            {
                std::transform(source->begin(), source->end(), node->keys.begin(), std::ostream_iterator<std::string> (os,""),
                               [&](LeafP child_node, int k){print<LeafP>(child_node, os, space_counter + 3);
                                                        return space + std::to_string(k) + "\n";});
            }
            else
            {
                std::cerr << "error: print: empty InnerNode source\n";
            }
        }
        else
        {
            std::cerr << "error: print: empty LeafP alternative\n";
        }*/
    }
    else if constexpr (is_variant_member_v<VectInnerP,VariantT>)
    {
        print_node<NodeT,InnerP>(node, os, space_counter, "InnerP");
        /*if (std::holds_alternative<VectInnerP>(node->source))
        {
            auto* source = &std::get<VectInnerP>(node->source);
            if ((source->size() > 0) && (node->keys.size() > 0))
            {
                std::transform(source->begin(), source->end(), node->keys.begin(), std::ostream_iterator<std::string> (os,""),
                               [&](InnerP child_node, int k){print<InnerP>(child_node, os, space_counter + 3);
                                                        return space + std::to_string(k) + "\n";});
            }
            else
            {
                std::cerr << "error: print: empty InnerNode source\n";
            }
        }
        else
        {
            std::cerr << "error: print: empty LeafP alternative\n";
        }*/
    }
    else
    {
        std::cerr << "error: print: unknown source\n";
    }
    //os << space + "-inf\n";
}

template<typename NodeT>
void print(DataP data, std::ostream& os, size_t space_counter){
    auto space = std::string(space_counter, ' ');
    os << space + std::to_string(data->key) + " " + data->source + "\n";
}

template<typename NodeT, typename AlternativeT>
void print_node(NodeT node, std::ostream& os, size_t space_counter, std::string message){
    auto space = std::string(space_counter, ' ');

    if (std::holds_alternative<std::vector<AlternativeT>>(node->source))
    {
        auto* source = &std::get<std::vector<AlternativeT>>(node->source);
        if ((source->size() > 0) && (node->keys.size() > 0))
        {
            std::transform(source->begin(), source->end(), node->keys.begin(), std::ostream_iterator<std::string> (os,""),
                           [&](AlternativeT child_node, int k){print<AlternativeT>(child_node, os, space_counter + 3);
                                                    return space + std::to_string(k) + "\n";});
        }
        else
        {
            std::cerr << "error: print: empty " + message + " source\n";
        }
    }
    else
    {
        std::cerr << "error: print: empty " + message + " alternative\n";
    }
}

template<typename NodePT>
NodePT node_constructor(){
    if constexpr (std::is_same_v<NodePT,LeafP>)
    {
        return LeafP();
    }
    else if constexpr (std::is_same_v<NodePT,InnerP>)
    {
        return InnerP();
    }
    else
    {
        std::cerr << "error: 5\n";
    }
}

template<typename NodeT, typename AlternativeT>
std::vector<AlternativeT>* parse_vector_or_variant(NodeT node){
    std::vector<AlternativeT>* source;
    using VariantT = decltype(node->source);
    if constexpr ((std::is_same_v<VariantT,std::variant<VectInnerP,VectLeafP>> ||
                   std::is_same_v<VariantT,std::variant<VectInnerP,VectLeafP,VectDataP>>) &&
                  (!std::is_same_v<DataP,AlternativeT> || std::is_same_v<RootP,NodeT>))
    {
        if constexpr (is_variant_member_v<std::vector<AlternativeT>,VariantT>)
        {
            if (std::holds_alternative<std::vector<AlternativeT>>(node->source))
            {
                source = &std::get<std::vector<AlternativeT>>(node->source);
            }
            else
            {
                std::cerr << "error: 1\n";
            }
        }
        else
        {
            std::cerr << "error: 7\n";
        }
    }
    else
    {
        source = &node->source;
    }
    return source;
}

template<typename NewNodeT, typename OldNodeT>
void split_root(RootP root){
    int t = root->tree_parameter;
    NewNodeT left_node  = node_constructor<NewNodeT>();
    NewNodeT right_node = node_constructor<NewNodeT>();

    std::vector<OldNodeT>left_source(t);
    std::vector<OldNodeT>right_source(t);

    std::vector<OldNodeT>* root_source = parse_vector_or_variant<RootP,OldNodeT>(root);

    std::move(root_source->begin(),
                            root_source->begin() + t,
                            left_source.begin());
    root_source->shrink_to_fit();
    std::move(root_source->begin(),
              root_source->end(),
              right_source.begin());
    left_node->source  = left_source;
    right_node->source = right_source;

    root_source->clear();
    std::vector<NewNodeT> new_root_source;
    new_root_source.push_back(left_node);
    new_root_source.push_back(right_node);
    root->source = new_root_source;

    auto* keys = &root->keys;
    left_node->keys = std::vector<int>(t);
    right_node->keys = std::vector<int>(t);
    std::move(std::move(keys->begin(),
                        keys->begin() + t,
                        left_node->keys.begin()),
              keys->end(),
              right_node->keys.begin());
    keys->push_back(right_node->keys[0]);
}

template<typename ParentPT, typename ChildPT, typename SourceT>
struct has_child
   : public std::disjunction<
        std::bool_constant<std::is_same_v<VectDataP,SourceT> && std::is_same_v<DataP,ChildPT>>,
        std::bool_constant<is_variant_member_v<VectInnerP,SourceT> && std::is_same_v<InnerP,ChildPT>>,
        std::bool_constant<is_variant_member_v<VectLeafP,SourceT> && std::is_same_v<LeafP,ChildPT>>,
        std::bool_constant<is_variant_member_v<VectDataP,SourceT> && std::is_same_v<DataP,ChildPT> && std::is_same_v<RootP,ParentPT>>> {};

template<typename ParentPT, typename ChildPT, typename SourceT>
constexpr bool has_child_v = has_child<ParentPT,ChildPT,SourceT>::value;

template<typename ParentPT, typename ChildPT>
void rebuilder(ParentPT parent_node, ChildPT child_node){
    int   child_key;
    if constexpr (std::is_same_v<DataP,ChildPT>)
    {
        child_key = child_node->key;
    }
    else
    {
        child_key = child_node->keys[0];
    }
    auto* keys      = &parent_node->keys;
    auto  it        = std::lower_bound(keys->begin(), keys->end(), child_key);
    int   idx       = static_cast<int>(it - keys->begin());
    int   t         = parent_node->tree_parameter;

    if ((it != keys->end()) && (*it == child_key))
    {
        std::cerr << "error: key " << child_key << " already exists\n";
    }

    if constexpr (has_child_v<ParentPT,ChildPT,decltype(parent_node->source)>)
    {
        std::vector<ChildPT>* source = parse_vector_or_variant<ParentPT,ChildPT>(parent_node);
        keys->insert(it, child_key);
        source->insert(source->begin() + idx, child_node);
        if constexpr (!std::is_same_v<ChildPT,DataP>)
        {
            child_node->parent = parent_node;
        }
        if (source->size() == parent_node->size_up_border)
        {
            if constexpr (std::is_same_v<RootP,ParentPT>)
            {
                if constexpr (std::is_same_v<DataP,ChildPT>)
                {
                    split_root<LeafP,DataP>(parent_node);
                }
                else
                {
                    split_root<InnerP,ChildPT>(parent_node);
                }
            }
            else
            {
                ParentPT new_node = node_constructor<ParentPT>();
                new_node->source  = std::vector<ChildPT>();
                std::move(source->begin() + t,
                          source->end(),
                          new_node->source->begin());
                source->shrink_to_fit();

                std::move(keys->begin() + t,
                          keys->end(),
                          new_node->keys.begin());
                keys->shrink_to_fit();
                if constexpr (std::holds_alternative<RootP>(parent_node->parent))
                {
                    rebuilder<RootP,ParentPT>(std::get<RootP>(parent_node->parent),new_node);
                }
                else if constexpr (std::holds_alternative<InnerP>(parent_node->parent))
                {
                    rebuilder<InnerP,ParentPT>(std::get<InnerP>(parent_node->parent),new_node);
                }
                else
                {
                    std::cerr << "error: 3\n";
                }
            }
        }
    }
    else
    {
        using VariantT = decltype(parent_node->source);
        if constexpr (is_variant_member_v<InnerP,VariantT>)
        {
            if (std::holds_alternative<InnerP>(parent_node->source))
            {
                rebuilder<InnerP,ChildPT>(std::get<VectInnerP>(parent_node->source).at(it),child_node);
            }
        }
        else if constexpr (is_variant_member_v<LeafP,VariantT>)
        {
            if (std::holds_alternative<LeafP>(parent_node->source))
            {
                rebuilder<LeafP,ChildPT>(std::get<VectLeafP>(parent_node->source).at(it),child_node);
            }
        }
    }
}

};
#endif // TREE_H
