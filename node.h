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

typedef std::vector<InnerP> VectInnerP;
typedef std::vector<LeafP>  VectLeafP;
typedef std::vector<DataP>  VectDataP;

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

}
#endif


