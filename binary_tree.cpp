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

Data get_element(std::vector<Data>::iterator beginnig, int index)
{
    return (*(beginnig + index));
}

void insert_sequence(Node* node,
                     std::vector<Data>::iterator beginning,
                     int left_bound, int right_bound,
                     bool (*cmp)(const Data&, const Data&))
{
    if (!node->is_filled() && (left_bound + 1 == right_bound))
    {
        node->set_data(get_element(beginning, left_bound).get());
    }
    else if (node->is_filled())
    {
        std::cerr << "insert_sequence: node " << node->get_data_value()
                  << " was already filled when tried to insert " << get_element(beginning, left_bound).get() << "\n";
    }
    else
    {
        int setting_index    = (left_bound + right_bound -1 -(left_bound + right_bound) % 2)/2;
        Data setting_element = get_element(beginning, setting_index);
        std::vector<Data>::iterator new_right_bound = std::lower_bound(beginning + left_bound, beginning + right_bound, setting_element, cmp);
        std::vector<Data>::iterator new_left_bound = std::upper_bound(beginning + left_bound, beginning + right_bound, setting_element, cmp);

        if (!node->is_filled())
        {
            node->set_data(setting_element);
        }
        else
        {
            new_right_bound++;
        }
        if (beginning + left_bound != new_right_bound)
        {
            node->set_left(new Node());
            insert_sequence(node->get_left(), beginning, left_bound, static_cast<int>(new_right_bound - beginning));
        }
        if (beginning + right_bound != new_left_bound)
        {
            node->set_right(new Node());
            insert_sequence(node->get_right(), beginning, static_cast<int>(new_left_bound - beginning), right_bound);
        }
    }
}
/*
void load_to_node(Node* node,
                  std::vector<Data>::iterator ll_bound, std::vector<Data>::iterator lr_bound,
                  std::vector<Data>::iterator rl_bound, std::vector<Data>::iterator rr_bound,
                  bool (*cmp)(const Data&, const Data&) = compare_data)
{
    if (node->get_left() == nullptr)
    {
        node->set_left(new Node());
        node->get_left()->set_parent(node);
        insert_sequence(node->get_left(), ll_bound, lr_bound);
    }
    else
    {
        load_to_node(node->get_left(),
                     ll_bound,  std::lower_bound(ll_bound, lr_bound, node->get_data(), cmp),
                     std::upper_bound(ll_bound, lr_bound, node->get_data(), cmp), lr_bound);
    }
    if (node->get_right() == nullptr)
    {
        node->set_right(new Node());
        node->get_right()->set_parent(node);
        insert_sequence(node->get_right(), rl_bound, rr_bound);
    }
    else
    {
        load_to_node(node->get_right(),
                     rl_bound,  std::lower_bound(rl_bound, rr_bound, node->get_data(), cmp),
                     std::upper_bound(rl_bound, rr_bound, node->get_data(), cmp), rr_bound);
    }
}

void bulk_load(Node* root, std::vector<Data> loading_elements, bool (*cmp)(const Data&, const Data&))
{
    //note: add repeat elements deleting
    std::sort(loading_elements.begin(), loading_elements.end(), cmp);
    //std::vector<Data>::iterator element = loading_elements.begin();
    load_to_node(root,
                 loading_elements.begin(), std::lower_bound(loading_elements.begin(), loading_elements.end(), root->get_data(), cmp),
                 std::upper_bound(loading_elements.begin(), loading_elements.end(), root->get_data(), cmp), loading_elements.end());
}
*/
Node::Node(): data(new Data(-1)), left(nullptr), right(nullptr), parent(nullptr){}

Node::Node(int data, Node* left, Node* right, Node* parent)
    : data(new Data(data)), left(left), right(right), parent(parent){}

Node::Node(Data data, Node* left, Node* right, Node* parent)
    : data(new Data(data)), left(left), right(right), parent(parent){}

Node::Node(Data* data, Node* left, Node* right, Node* parent)
    : data(new Data(*data)), left(left), right(right), parent(parent){}

Node::~Node(){
    delete this->data;
}

bool Node::is_filled()
{
    return (this->get_data_value() != -1);
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
    this->left       = new_left;
    new_left->parent = this;
}
void Node::set_right(Node* new_right) {
    this->right       = new_right;
    new_right->parent = this;
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
