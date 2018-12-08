#ifndef NODE_H
#define NODE_H

#include "data.h"

#include <vector>
#include <memory>
#include <map>
#include <variant>
#include <algorithm>
#include <iterator>
#include <type_traits>
#include <typeinfo>

namespace b_plus_tree{

class RootNode;
class InnerNode;
class LeafNode;

typedef std::shared_ptr<RootNode>  RootP;
typedef std::shared_ptr<InnerNode> InnerP;
typedef std::shared_ptr<LeafNode>  LeafP;
typedef std::shared_ptr<Data>      DataP;

class Node
{
public:
    Node();
    Node(int tree_parameter);
    virtual ~Node();

    virtual void rebuilding_insert(DataP data);

    const int        tree_parameter;
    const int        size_up_border  = 2*tree_parameter + 1;
    std::vector<int> keys;
};

template<typename NodeT>
void print(std::shared_ptr<NodeT> node, std::ostream& os, size_t space_counter){
    auto space = std::string(space_counter, ' ');
    std::variant<int,double> l;
    os << space + "+inf\n";
    std::visit([&](auto arg) {
        using SourceT = std::decay_t<decltype(arg)>;
        std::vector<DataP> f;
        std::cout << std::is_same_v<SourceT, std::vector<DataP>> << "\n";
        //std::cout << typeid(arg).name() << "\n";
        if constexpr((std::is_same_v<SourceT, std::vector<InnerP>>) ||
                     (std::is_same_v<SourceT, std::vector<LeafP>>))
        {
            std::transform(arg.begin(), arg.end(), node->keys.begin(), std::ostream_iterator<std::string> (os,"\n"),
                           [&](auto child_node, auto k){print(child_node, os, space_counter + 3);
                                                        return space + std::to_string(k) + "\n";});
        }
        else if constexpr(std::is_same_v<SourceT, std::vector<DataP>>)
        {
            std::for_each(arg.begin(), arg.end(),
                          [&](DataP data){
                          os << space + std::to_string(data->key) + " " + data->source + "\n";
            });
        }
        else
        {
            std::cout << "wrong_t\n";
        }
    }, l);
    os << space + "-inf\n";
}

}

#endif // NODE_H
