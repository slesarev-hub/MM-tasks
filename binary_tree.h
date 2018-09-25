#ifndef BINARY_TREE_H
#define BINARY_TREE_H

#include <vector>

namespace binary_tree
{

class Data {
public:
    Data();
    Data(int value);
    Data(const Data& new_data);
    ~Data();

    Data& operator = (const Data& other);

    int get() const;
    void set(int new_value);

private:
    int value;
};

class Node {
public:
    //Node(std::vector<Data>& data_vector, bool (*data_cmp)(const Data&, const Data&) = compare_data);
    Node();
    Node(int data, Node* left = nullptr, Node* right = nullptr, Node* parent = nullptr);
    Node(Data data, Node* left = nullptr, Node* right = nullptr, Node* parent = nullptr);
    Node(Data* data, Node* left = nullptr, Node* right = nullptr, Node* parent = nullptr);
    ~Node();

    Data* get_data() const;
    int   get_data_value() const;
    void  set_data(Data new_data);

    void set_left(Node* new_left);
    void set_right(Node* new_right);
    void set_parent(Node* new_parent);

    Node* get_left();
    Node* get_right();
    Node* get_parent();

    std::vector<Data> direct_order_traversal();
    std::vector<Data> level_order_traversal();

    void level_order_traversal_print();
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

bool compare_data(const Data& d1, const Data& d2);

Node* bulk_load(std::vector<Data>& data_vector, bool (*data_cmp)(const Data&, const Data&) = compare_data);
}

#endif // BINARY_TREE_H

