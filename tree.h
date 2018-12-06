#ifndef TREE_H
#define TREE_H

#include "node.h"

namespace b_plus_tree{

class Tree
{
public:
    Tree();
    Tree(int tree_parameter, int insert_parameter, int delete_parameter);
    ~Tree();

    void rebuilding_insert(std::unique_ptr<Data>);

    friend std::ostream& operator<<(std::ostream& os, const Tree& t);

    int                                  insert_parameter;
    int                                  delete_parameter;
    int                                  depth;

    std::shared_ptr<RootNode>            root;
    std::map<int, std::unique_ptr<Data>> deferred_insert;
    std::vector<int>                     deferred_delete;
};

};
#endif // TREE_H
