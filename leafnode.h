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

    const int                    size_low_border = tree_parameter - 1;
    std::variant<RootP, InnerP>  parent;
    LeafP                        next;
    std::vector<DataP>           source;
};

};

#endif // LEAFNODE_H
