#ifndef TREE_H
#define TREE_H

#include "node.h"
#include "innernode.h"
#include "leafnode.h"
#include "rootnode.h"

namespace b_plus_tree{

class Tree
{
public:
    Tree();
    Tree(int tree_parameter, int insert_parameter, int delete_parameter);
    ~Tree();

    void rebuilding_insert(std::shared_ptr<Data>);

    friend std::ostream& operator<<(std::ostream& os, const Tree& t);

    int                  insert_parameter;
    int                  delete_parameter;
    int                  depth;

    RootP                root;
    std::map<int, DataP> deferred_insert;
    std::vector<int>     deferred_delete;
};

};
#endif // TREE_H
