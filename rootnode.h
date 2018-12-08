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

    const int                         size_low_border = 1;
    std::variant<std::vector<InnerP>,
                 std::vector<LeafP>,
                 std::vector<DataP>>  source;
};

};
#endif // ROOTNODE_H
