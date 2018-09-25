#include "binary_tree.h"

#include <iostream>
#include <stack>
#include <vector>
#include <queue>
#include <algorithm>

namespace binary_tree {

#define DEBUG

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

int Data::get() const {
    return this->value;
}
void Data::set(int new_value) {
    this->value = new_value;
}

bool compare_data(const Data& d1, const Data& d2) {
    return d1.get() < d2.get();
}

void bulk_load_recursive_call(Node* root, const std::vector<Data>& data_vector, size_t left_bound, size_t right_bound) {
    if (left_bound <= right_bound)
    {
        if (right_bound == left_bound)
        {
            #ifdef DEBUG
            std::cout << "set: " << data_vector[left_bound].get() << " " << left_bound << " " << right_bound << "\n";
            #endif
            root->set_data(data_vector[left_bound].get());
        }
        else if (right_bound - 1 == left_bound)
        {
            #ifdef DEBUG
            std::cout << "last: " << data_vector[left_bound].get() << " " << data_vector[right_bound].get() << "\n";
            #endif
            root->set_data(data_vector[left_bound].get());
            root->set_right(new Node(data_vector[right_bound].get()));
        }
        else if ((right_bound + left_bound) % 2 == 0)
        {
            size_t middle_id = (right_bound + left_bound)/2;
            root->set_data(data_vector[middle_id].get());
            root->set_left(new Node(-1));
            root->set_right(new Node(-1));
            #ifdef DEBUG
            std::cout << "set: " << data_vector[middle_id].get() << " " << left_bound << " " << middle_id << " " << right_bound << "\n";
            std::cout << "bulk: " << left_bound << " " << middle_id - 1 << "\n";
            std::cout << "bulk: " << middle_id + 1 << " " << right_bound << "\n";
            #endif
            bulk_load_recursive_call(root->get_left(), data_vector, left_bound, middle_id - 1);
            bulk_load_recursive_call(root->get_right(), data_vector, middle_id + 1, right_bound);
        }
        else
        {
            size_t middle_id = (right_bound + left_bound + 1)/2;
            #ifdef DEBUG
            std::cout << "bulk: " << left_bound << " " << middle_id - 1 << "\n";
            std::cout << "bulk: " << middle_id << " " << right_bound << "\n";
            #endif
            root->set_left(new Node(-1));
            bulk_load_recursive_call(root->get_left(), data_vector, left_bound, middle_id - 1);
            bulk_load_recursive_call(root, data_vector, middle_id, right_bound);
        }
    }
}

Node* bulk_load(std::vector<Data>& data_vector, bool (*data_cmp)(const Data&, const Data&)) {
    sort(data_vector.begin(), data_vector.end(), data_cmp);
    Node* root = new Node(-1);
    bulk_load_recursive_call(root, data_vector, 0, data_vector.size() - 1);
    return root;
}

Node::Node(): data(new Data(-1)){}

Node::Node(int data, Node* left, Node* right, Node* parent)
    : data(new Data(data)), left(left), right(right), parent(parent){}

Node::Node(Data data, Node* left, Node* right, Node* parent)
    : data(new Data(data)), left(left), right(right), parent(parent){}

Node::Node(Data* data, Node* left, Node* right, Node* parent)
    : data(new Data(*data)), left(left), right(right), parent(parent){}

Node::~Node(){
    delete this->data;
}

Data* Node::get_data() const {
    if (this->data == nullptr)
    {
        std::cerr << "get_data: nullptr returned\n";
    }
    return this->data;
}
int  Node::get_data_value() const {
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
        std::string s(static_cast<ulong>(space_counter), '*');
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
    Node* next_node = nullptr;
    while (node_iter != nullptr) {
        //searching node
        next_node = (key > node_iter->get_data_value()) ? (node_iter->right) : (node_iter->left);
        if (key == node_iter->get_data_value())
        {
            break;
        }
        if (next_node != nullptr)
        {
            node_iter = next_node;
        }
        else
        {
            std::cerr << "erase: no key " << key << "\n";
            return false;
        }
    }
    if (node_iter == nullptr)
    {
        std::cerr << "erase: no key " << key << "\n";
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
        node_iter->left         = nullptr;
    }
    //now node_iter can has no more than one child
    Node* child = (node_iter->right != nullptr) ? (node_iter->right) : (node_iter->left);

    if ((node_iter->parent == nullptr) && (child != nullptr))
    {
        Node* left_child  = child->left;
        Node* right_child = child->right;

        this->set_data(child->get_data_value());
        this->left  = child->left;
        this->right = child->right;
        delete child;
        if (left_child != nullptr)
        {
            left_child->parent = this;
        }
        if (right_child != nullptr)
        {
            right_child->parent = this;
        }
    }
    else if ((node_iter->parent == nullptr) && (child == nullptr))
    {
        std::cerr << "erase: last element\n";
        return false;
    }
    else if (node_iter->parent != nullptr)
    {
        if (child != nullptr)
        {
            child->parent = node_iter->parent;
        }
        if (node_iter->parent->get_data_value() > node_iter->get_data_value())
        {
            node_iter->parent->left = child;
        }
        else
        {
            node_iter->parent->right = child;
        }
    }
    if (this != node_iter)
    {
        delete node_iter;
    }
    return true;
}

}
