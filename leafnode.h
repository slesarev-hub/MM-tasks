#ifndef LEAFNODE_H
#define LEAFNODE_H

#include "node.h"

namespace b_plus_tree{

class LeafNode : public Node
{
public:
    LeafNode();
    LeafNode(int tree_parameter);
    //LeafNode(InnerNode& parent);
    //LeafNode(std::shared_ptr<Node> parent);
    ~LeafNode();

    void print(std::ostream& os, int space_counter);

    const int                                size_low_border = tree_parameter - 1;
    std::variant<std::shared_ptr<RootNode>,
                 std::shared_ptr<InnerNode>> parent;
    std::shared_ptr<LeafNode>                next;
    std::vector<std::unique_ptr<Data>>       source;
};

};

#endif // LEAFNODE_H
