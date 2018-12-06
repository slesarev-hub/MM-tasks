#ifndef INNERNODE_H
#define INNERNODE_H

#include "node.h"

namespace b_plus_tree{

class InnerNode : public Node
{
public:
    InnerNode();
    InnerNode(int tree_parameter);
    //InnerNode(Node& parent);
    //InnerNode(std::shared_ptr<Node> parent);
    ~InnerNode();

    void print(std::ostream& os, int space_counter);

    const int                                size_low_border = tree_parameter - 1;
    std::variant<std::shared_ptr<RootNode>,
                 std::shared_ptr<InnerNode>> parent;
    std::variant<std::vector<std::shared_ptr<InnerNode>>,
                 std::vector<std::shared_ptr<LeafNode>>> source;
};

};

#endif // INNERNODE_H
