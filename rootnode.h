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

    void print(std::ostream& os, int space_counter);

    const int                            size_low_border = 1;
    std::variant<std::vector<std::shared_ptr<InnerNode>>,
                 std::vector<std::shared_ptr<LeafNode>>,
                 std::vector<std::unique_ptr<Data>>>      source;
};

};
#endif // ROOTNODE_H
