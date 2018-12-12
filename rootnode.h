#ifndef ROOTNODE_H
#define ROOTNODE_H

#include "node.h"

namespace b_plus_tree{

class RootNode : public Node
{
public:
    RootNode();
    RootNode(int tree_parameter);
    ~RootNode();

    void rebuilding_insert(DataP data);

    const int                         size_low_border = 1;
    std::variant<VectInnerP,
                 VectLeafP,
                 VectDataP>  source;
};

}

#endif // ROOTNODE_H
