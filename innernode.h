#ifndef INNERNODE_H
#define INNERNODE_H

#include "node.h"

namespace b_plus_tree{

class InnerNode : public Node
{
public:
    InnerNode();
    InnerNode(int tree_parameter);
    ~InnerNode();

    void rebuilding_insert(DataP data);

    const int                        size_low_border = tree_parameter - 1;
    std::variant<RootP, InnerP>      parent;
    std::variant<VectInnerP,
                 VectLeafP> source;
};

}

#endif // INNERNODE_H
