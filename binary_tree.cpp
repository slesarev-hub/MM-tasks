#include "binary_tree.h"

#include <iostream>
#include <stack>
#include <vector>
#include <queue>

Data::Data(){};
Data::Data(const Data& new_data) {
    this->value = new_data.value;
}
Data::Data(int value): value(value){}
Data::~Data(){}

Data& Data::operator = (const Data& other) {
    if (this != &other)
    {
        this->value = other.value;
    }
    return *this;
}

int Data::get() {
    return this->value;
}
void Data::set(int new_value) {
    this->value = new_value;
}

Node::Node(int data, Node* left, Node* right, Node* parent)
    : data(new Data(data)), left(left), right(right), parent(parent){}

Node::Node(Data data, Node* left, Node* right, Node* parent)
    : data(new Data(data)), left(left), right(right), parent(parent){}

Node::Node(Data* data, Node* left, Node* right, Node* parent)
    : data(new Data(*data)), left(left), right(right), parent(parent){}

Node::Node(Node& new_node)
    : data(new_node.data), left(new_node.left), right(new_node.right){}

Node::~Node(){
    this->data->~Data();
}

Data* Node::get_data() {
    return this->data;
}
int  Node::get_data_value() {
    return this->get_data()->get();
}
void Node::set_data(Data new_data) {
    delete this->data;
    this->data = new Data(new_data);
}

void Node::set_left(Node* new_left) {
    this->left = new_left;
}
void Node::set_right(Node* new_right) {
    this->right = new_right;
}
void Node::set_parent(Node* new_parent) {
    this->parent = new_parent;
}

Node* Node::get_left() {
    return this->left;
}
Node* Node::get_right() {
    return this->right;
}
Node* Node::get_parent() {
    return this->parent;
}

void delete_all_tree_from_root(Node* root) {
    delete root->get_data();
    if (root->get_left() != nullptr) {
        delete_all_tree_from_root(root->get_left());
    }
    if (root->get_right() != nullptr) {
        delete_all_tree_from_root(root->get_right());
    }
    delete root;
}

// delete tree by any node
void delete_all_tree(Node* node) {
    Node* current_node = node;
    while (current_node->get_parent() != nullptr) {
        current_node = current_node->get_parent();
    }
    delete_all_tree_from_root(current_node);
}

std::vector<Data> Node::level_order_traversal() {
    std::queue<Node*> nodes;
    std::vector<Data> tree_elements(0);
    Node* current_node = nullptr;
    nodes.push(this);

    while (!nodes.empty())
    {
        current_node = nodes.front();
        nodes.pop();
        tree_elements.push_back(*current_node->data);

        if (current_node->left != nullptr)
        {
            nodes.push(current_node->left);
        }

        if (current_node->right != nullptr)
        {
            nodes.push(current_node->right);
        }
    }
    return tree_elements;
}

void Node::level_order_traversal_print() {
    std::queue<Node*> nodes;
    nodes.push(this);
    Node* current_node = nullptr;

    while (!nodes.empty())
    {
        current_node = nodes.front();
        nodes.pop();
        std::cout << current_node->get_data_value() << " ";

        if (current_node->left != nullptr)
        {
            nodes.push(current_node->left);
        }

        if (current_node->right != nullptr)
        {
            nodes.push(current_node->right);
        }
    }
}

std::vector<Data> Node::direct_order_traversal()
{
    std::stack<Node*> nodes;
    std::vector<Data> tree_elements(0);
    nodes.push(this);
    Node* current_node = nullptr;

    while (!nodes.empty())
    {
        current_node = nodes.top();
        nodes.pop();
        tree_elements.push_back(*current_node->data);

        if (current_node->right)
        {
            nodes.push(current_node->right);
        }
        if (current_node->left)
        {
            nodes.push(current_node->left);
        }
    }
    return tree_elements;
}

void Node::direct_order_traversal_print()
{
    std::stack<Node*> nodes;
    nodes.push(this);
    Node* current_node = nullptr;

    while (!nodes.empty())
    {
        current_node = nodes.top();
        nodes.pop();
        std::cout << current_node->get_data_value() << " ";

        if (current_node->right != nullptr)
        {
            nodes.push(current_node->right);
        }
        if (current_node->left != nullptr)
        {
            nodes.push(current_node->left);
        }
    }
}

void Node::print(int space_counter) {
    if (this->data != nullptr) {
        std::string s(static_cast<ulong>(space_counter), ' ');
        std::cout << s << this->get_data_value() << "\n";
    }
    else
    {
        std::cout << "NO_DATA\n";
    }

    if (this->left != nullptr) {
        this->left->print(space_counter + 1);
    }

    if (this->right != nullptr) {
        this->right->print(space_counter + 1);
    }
}

bool Node::insert(Data* inserting_data) {
    if ((this->data  == nullptr) &&
        (this->left  == nullptr) &&
        (this->right == nullptr)) {
        this->set_data(*inserting_data);
        return true;
    }
    Node *node_iter = this;

    while (node_iter != nullptr) {
        if (inserting_data->get() > node_iter->get_data_value())
        {
            if (node_iter->right != nullptr)
            {
                node_iter = node_iter->right;
                continue;
            }
            else
            {
                node_iter->set_right(new Node(inserting_data, nullptr, nullptr, node_iter));
                return true;
            }
        }
        else if (inserting_data->get() < node_iter->get_data_value())
        {
            if (node_iter->left != nullptr)
            {
                node_iter = node_iter->left;
                continue;
            }
            else
            {
                node_iter->set_left(new Node(inserting_data, nullptr, nullptr, node_iter));
                return true;
            }
        }
        else
        {
            return false;
        }
   }
   return true;
}

bool Node::insert(Node* inserting_node) {

    if ((this->data == nullptr) &&
        (this->left == nullptr) &&
        (this->right == nullptr))
    {
        this->data   = inserting_node->data;
        this->left   = inserting_node->left;
        this->right  = inserting_node->right;
        this->parent = inserting_node->parent;
        delete inserting_node;
        return true;
    }
    Node* node_iter = this;

    if (inserting_node->parent != nullptr)
    {
        return false;
    }
    while (node_iter != nullptr)
    {
        if (inserting_node->get_data_value() > node_iter->get_data_value())
        {
            if (node_iter->right != nullptr)
            {
                node_iter = node_iter->right;
                continue;
            }
            else
            {

                node_iter->right         = inserting_node;
                node_iter->right->parent = node_iter;
                return true;
            }
        }
        else if (inserting_node->get_data_value() < node_iter->get_data_value())
        {
            if (node_iter->left != nullptr)
            {
                node_iter = node_iter->left;
                continue;
            }
            else
            {
                node_iter->left         = inserting_node;
                node_iter->left->parent = node_iter;
                return true;
            }
        }
        else
        {
            return false;
        }
   }
   return true;
}

bool Node::erase(int key) {
    if ((this->left  == nullptr) &&
        (this->right == nullptr) &&
        (this->data  == nullptr))
    {
        return false;
    }

    Node* node_iter = this;
    while (node_iter != nullptr) {
        //searching node
        if (key > node_iter->get_data_value())
        {
            if (node_iter->right != nullptr)
            {
                node_iter = node_iter->right;
                continue;
            }
            else
            {
                return false;
            }
        }
        else if (key < node_iter->get_data_value())
        {
            if (node_iter->left != nullptr)
            {
                node_iter = node_iter->left;
                continue;
            }
            else
            {
                return false;
            }
        }
        else
        {
            break;
        }
    }
    if (node_iter == nullptr)
    {
        std::cout << "Node::erase null node_iter\n";
        return false;
    }
    Node* transfering_node = nullptr;

    //deleting-node has two children:
    //put right-node to the place of deleting-node
    //put left-node as left child of most-left-node in right-node subtree
    if ((node_iter->left != nullptr) && (node_iter->right != nullptr))
    {
        transfering_node = node_iter->right;

        Node* most_left  = node_iter->right;
        while(most_left->left != nullptr)
        {
            most_left = most_left->left;
        }
        most_left->left         = node_iter->left;
        node_iter->left->parent = most_left;
    }
    //deleting-node has one child
    else if ((node_iter->left != nullptr) || (node_iter->right != nullptr))
    {
        Node* child = (node_iter->left == nullptr) ? (node_iter->right) : (node_iter->left);
        child->parent = node_iter->parent;
        if (node_iter->get_data_value() > node_iter->parent->get_data_value())
        {
            node_iter->parent->right = child;
        }
        else
        {
            node_iter->parent->left = child;
        }
    }
    //change deleting-node-parent (if deleting-node hasn't children, transfering-node = nullptr)
    if (node_iter->parent->get_data_value() > node_iter->get_data_value())
    {
        node_iter->parent->left = transfering_node;
    }
    else
    {
        node_iter->parent->right = transfering_node;
    }

    delete node_iter;
    return true;
}
