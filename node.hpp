#ifndef NODE_H
#define NODE_H

#include "data.hpp"

#include <mutex>
#include <vector>
#include <memory>
#include <algorithm>

class Node 
{
public:
    Node();
    Node(const Data& data, std::shared_ptr<Node> next, int key);
    Node(const Data& data, int key);
    ~Node();
    Node(const Node& other);
    Node(Node& other) = delete;

    void lock() const;
    void unlock() const;

    void set_next(std::shared_ptr<Node> next);
    void set_key(int key);
    void add_source(const Data& data);
    bool is_stored(const Data& data);
    int  size();

    std::vector<Data>::iterator find(const Data& data);
    std::vector<Data>::iterator erase(std::vector<Data>::iterator it);

    std::shared_ptr<Node> get_next() const;
    int                   get_key() const;
    std::mutex&           get_mutex() const;

    friend std::ostream& operator<<(std::ostream& out, const Node& n);

private: 
    std::shared_ptr<Node> next;

    int                key;
    mutable std::mutex mtx;
    std::vector<Data>  source;
};

#endif