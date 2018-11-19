#ifndef NODE_H
#define NODE_H

#include <vector>
#include <memory>

namespace bplustree 
{
    template<typename T>
    class Node 
    {
    public:
        Node();
        ~Node();
        
    private:
        std::vector<int>                keys;
        std::vector<std::unique_ptr<T>> nodes;
        
    };
    
    template<typename T>
    class Tree : public Node<T>
    {
    public:
        Tree();
        ~Tree();
    
    private:
        int                             tree_parameter;
        int                             insert_parameter;
        int                             delete_parameter;
        
        std::vector<std::unique_ptr<T>> deferred_insert;
        std::vector<int>                deferred_delete;
    };
}

#endif // NODE_H
