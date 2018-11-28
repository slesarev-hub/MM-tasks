#ifndef NODE_H
#define NODE_H

#include <vector>
#include <memory>
#include <map>
#include <variant>

#include "data.h"

namespace b_plus_tree{

template<typename T>
class Node
{
public:
    Node();
    Node(Node& parent);
    Node(Node* parent);
    Node(std::shared_ptr<Node> parent);
    Node(int tree_parameter);
    ~Node();

    virtual void rebuilding_insert(Data<T>& data);

    const int             tree_parameter;
    const int             size_low_border = tree_parameter - 1;
    const int             size_up_border  = 2*tree_parameter + 1;
    std::shared_ptr<Node> parent;
    std::vector<int>      keys;
    std::vector<T>        source;
};

template<typename T>
Node<T>::Node()
    : tree_parameter(2){}

template<typename T>
Node<T>::Node(Node& parent)
    : tree_parameter(parent.tree_parameter), parent(std::make_shared<Node>(parent)){}

template<typename T>
Node<T>::Node(Node* parent)
    : tree_parameter(parent->tree_parameter), parent(std::make_shared<Node>(parent)){}

template<typename T>
Node<T>::Node(std::shared_ptr<Node> parent)
    : tree_parameter(parent->tree_parameter), parent(parent){}

template<typename T>
Node<T>::Node(int tree_parameter)
    : tree_parameter(tree_parameter){}

template<typename T>
Node<T>::~Node(){}

template<typename T>
void Node<T>::rebuilding_insert(Data<T>& data){

}


template<typename T>
class Node<Data<T>>
{
public:
    //Node();
    //Node(const Node& parent);
    //Node(const Node* parent);
    //Node(std::shared_ptr<Node> parent);

    std::shared_ptr<Node>                 parent;
    std::vector<std::unique_ptr<Data<T>>> source;
    std::shared_ptr<Node>                 next;
};

template<typename T>
class Tree : public Node<T>
{
public:
    Tree();
    Tree(int tree_parameter, int insert_parameter, int delete_parameter);
    ~Tree();

    using Node<T>::tree_parameter;

    const int                               size_low_border = 1;
    const int                               size_up_border  = 2*tree_parameter + 1;
    int                                     insert_parameter;
    int                                     delete_parameter;

    std::map<int, std::unique_ptr<Data<T>>> deferred_insert;
    std::vector<int>                        deferred_delete;
};

template<typename T>
Tree<T>::Tree(){}

template<typename T>
Tree<T>::Tree(int tree_parameter, int insert_parameter, int delete_parameter)
    : Node<T>(tree_parameter), insert_parameter(insert_parameter), delete_parameter(delete_parameter){}

template<typename T>
Tree<T>::~Tree(){}
}

#endif // NODE_H
