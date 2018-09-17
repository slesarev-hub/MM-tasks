#ifndef BINARY_TREE_H
#define BINARY_TREE_H

#include <vector>

class Data {
public:
    Data(int value);
    Data(Data& new_data);
    ~Data();

    Data& operator = (const Data& other);

    int get();
    void set(int new_value);

private:
    int value;
};

class Node {
public:
    Node(int data, Node* left = nullptr, Node* right = nullptr, Node* parent = nullptr);
    Node(Data data, Node* left = nullptr, Node* right = nullptr, Node* parent = nullptr);
    Node(Data* data, Node* left = nullptr, Node* right = nullptr, Node* parent = nullptr);
    Node(Node& new_node);
    ~Node();

    Data* get_data();
    int   get_data_value();
    void  set_data(Data new_data);

    void set_left(Node* new_left);
    void set_right(Node* new_right);
    void set_parent(Node* new_parent);

    Node* get_left();
    Node* get_right();
    Node* get_parent();

    void levelOrderPrint();
    std::vector<Data> direct_order_traversal();

    void direct_order_traversal_print();
    void print(int space_counter = 0);

    bool insert(Data* inserting_data);
    bool insert(Node* inserting_node);

    bool erase(int key);

private:
    Data* data;
    Node* left;
    Node* right;
    Node* parent;
};

void delete_all_tree(Node* node);

#endif // BINARY_TREE_H
