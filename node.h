#ifndef NODE_H
#define NODE_H

#include "data.h"

#include <vector>
#include <memory>
#include <map>
#include <variant>
#include <algorithm>

namespace b_plus_tree{

class Node
{
public:
    Node();
    Node(int tree_parameter);
    virtual ~Node();

    virtual void rebuilding_insert(Data& data);
    virtual void print(std::ostream& os, int space_counter);

    const int        tree_parameter;
    const int        size_up_border  = 2*tree_parameter + 1;
    std::vector<int> keys;
};

class RootNode;
class InnerNode;
class LeafNode;

typedef std::shared_ptr<InnerNode> SharedInn;
typedef std::shared_ptr<LeafNode>  SharedLeaf;
typedef std::unique_ptr<Data>      UnData;

template<typename T>
struct SourceTraits;

template<>
struct SourceTraits<>

template<typename T>
void print(const T& node, std::ostream& os, size_t space_counter){
    os << std::string(space_counter, ' ') + "+inf\n";
    std::transform(node.source.begin(), node.source.end(), node.keys.begin(),
                   [&](T pt){
                       os << std::string(space_counter, ' ') << });
}

}

#endif // NODE_H
