#ifndef NODE_H
#define NODE_H

#include "data.hpp"

#include <mutex>
#include <vector>
#include <memory>

class Node 
{
public:
    Node();
    Node(const Data& data, std::shared_ptr<Node> prev, std::shared_ptr<Node> next, int key);
    Node(const Data& data, int key);
    ~Node();
    Node(const Node& other);
    Node(Node& other) = delete;

    void lock() const;
    void unlock() const;

    void set_prev(std::shared_ptr<Node> prev);
    void set_next(std::shared_ptr<Node> next);
    void set_key(int key);
    void add_source(const Data& data);

    std::shared_ptr<Node> get_prev() const;
    std::shared_ptr<Node> get_next() const;
    int                   get_key() const;
    std::mutex&           get_mutex() const;

private: 
    std::shared_ptr<Node> next;
    std::shared_ptr<Node> prev;

    int                key;
    mutable std::mutex mtx;
    std::vector<Data>  source;
};

#endif