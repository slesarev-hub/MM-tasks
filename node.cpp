#include "node.hpp"

Node::Node()
    : prev(nullptr), next(nullptr), key(-1){}

Node::Node(const Data& data, std::shared_ptr<Node> prev, std::shared_ptr<Node> next, int key)
    : prev(prev), next(next), key(key)
{
    this->source.emplace_back(data);
}

Node::Node(const Data& data, int key)
    : key(key)
{
    this->source.emplace_back(data);
}

Node::Node(const Node& other){}

Node::~Node(){}

void Node::lock() const
{
    this->mtx.lock();
}

void Node::unlock() const
{
    this->mtx.unlock();
}

void Node::set_prev(std::shared_ptr<Node> prev)
{
    this->prev = prev;
}

void Node::set_next(std::shared_ptr<Node> next)
{
    this->next = next;
}

void Node::set_key(int key)
{
    this->key = key;
}

void Node::add_source(const Data& data)
{
    this->source.emplace_back(data);
}

std::shared_ptr<Node> Node::get_prev() const
{
    return this->prev;
}

std::shared_ptr<Node> Node::get_next() const
{
    return this->next;
}

int Node::get_key() const
{
    return this->key;
}

std::mutex& Node::get_mutex() const
{
    return this->mtx;
}