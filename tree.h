#ifndef TREE_H
#define TREE_H

#include "node.h"
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


/*
template<typename NodeT>
struct print;

template<>
struct print<LeafP>{
    print(LeafP node, std::ostream& os, size_t space_counter){
        auto space = std::string(space_counter, ' ');
        auto* source = &std::get<VectDataP>(node->source);
        std::for_each(source->begin(), source->end(),
                      [&](DataP data){
                      os << space + std::to_string(data->key) + " " + data->source + "\n";});
    }
};

template<>
struct print<InnerP>{
    print(InnerP node, std::ostream& os, size_t space_counter){
        auto space = std::string(space_counter, ' ');
        using VariantT = decltype(node->source);
        os << space + "+inf\n";

        if (is_variant_member_v<VectDataP,VariantT> && std::holds_alternative<VectDataP>(node->source))
        {

        }
        if (is_variant_member_v<VectLeafP,VariantT> && std::holds_alternative<VectLeafP>(node->source))
        {
            auto* source = &std::get<VectLeafP>(node->source);
            std::transform(source->begin(), source->end(), node->keys.begin(), std::ostream_iterator<std::string> (os,""),
                           [&](LeafP child_node, int k){print<LeafP>(child_node, os, space_counter + 3);
                                                        return space + std::to_string(k) + "\n";});
        }
    }

};
*/
};
#endif // TREE_H
