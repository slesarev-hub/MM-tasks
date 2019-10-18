#ifndef LEAFNODE_H
#define LEAFNODE_H

#include "node.h"

namespace b_plus_tree{

class LeafNode : public Node
{
public:
    LeafNode();
    LeafNode(int tree_parameter);
    ~LeafNode();

    //void split();
    //void rebuilding_insert(DataP data);

    const int                   size_low_border = tree_parameter;
    std::variant<RootP,InnerP>  parent;
    LeafP                       next;
    VectDataP                   source;
};

};

#endif // LEAFNODE_H
