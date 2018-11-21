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
    ~Node();

    Node(const Node& parent);
    Node(Node* parent);

//private:
    std::vector<int>                   keys;
    std::variant<std::monostate,
                 std::vector<std::unique_ptr<Node>>,
                 std::vector<std::unique_ptr<Data<T>>>> nodes;
    std::unique_ptr<Node>              parent;
};

template<typename T>
class BottomNode : public Node<T>
{


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

template<typename T>
Node<T>::Node(){}

template<typename T>
Node<T>::Node(const Node& parent)
    : parent(std::make_unique<Node>(parent)){}

template<typename T>
Node<T>::Node(Node* parent)
    : parent(std::make_unique<Node>(parent)){}

}

#endif // NODE_H
