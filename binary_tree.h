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
    bool  operator == (const Data& other);

    int get() const;
    void set(int new_value);

private:
    int value;
};

class Node {
public:
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

    bool is_filled();

private:
    Data* data;
    Node* left;
    Node* right;
    Node* parent;
};

void delete_all_tree(Node* node);

bool compare_data(const Data& d1, const Data& d2);

void insert_sequence(Node* node,
                     std::vector<Data>::iterator beginnig,
                     int left_bound, int right_bound,
                     bool (*cmp)(const Data&, const Data&) = compare_data);

void find_node_to_load(Node* node,
                  std::vector<Data>::iterator beginning,
                  std::vector<Data>::iterator ll_bound, std::vector<Data>::iterator lr_bound,
                  std::vector<Data>::iterator rl_bound, std::vector<Data>::iterator rr_bound,
                  bool (*cmp)(const Data&, const Data&) = compare_data);

void bulk_load(Node* root, std::vector<Data> loading_elements, bool (*cmp)(const Data&, const Data&) = compare_data);
}

#endif // BINARY_TREE_H

