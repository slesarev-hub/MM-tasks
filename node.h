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
    ~Node();

    void rebuilding_insert(Data<T>& data);

    std::shared_ptr<Node> parent;
    std::vector<T>        source;
};

template<typename T>
Node<T>::Node(){}

template<typename T>
Node<T>::Node(Node& parent)
    : parent(std::make_shared<Node>(parent)){}

template<typename T>
Node<T>::Node(Node* parent)
    : parent(std::make_shared<Node>(parent)){}

template<typename T>
Node<T>::~Node(){}

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
    ~Tree();

private:
    int                                     tree_parameter;
    int                                     insert_parameter;
    int                                     delete_parameter;

    std::map<int, std::unique_ptr<Data<T>>> deferred_insert;
    std::vector<int>                        deferred_delete;
};

}

#endif // NODE_H
