#include "node.hpp"

Node::Node()
    : next(nullptr), key(-1){}

Node::Node(const Data& data, std::shared_ptr<Node> next, int key)
    : next(next), key(key)
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

bool Node::is_stored(const Data& data)
{
    return (std::find(this->source.begin(), this->source.end(), data) != this->source.end());
}

int Node::size()
{
    return this->source.size();
}

std::vector<Data>::iterator Node::find(const Data& data)
{
    return std::find(this->source.begin(), this->source.end(), data);
}

std::vector<Data>::iterator Node::erase(std::vector<Data>::iterator it)
{
    return this->source.erase(it);
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

std::ostream& operator<<(std::ostream& out, const Node& n)
{
    out << "key : " << n.key << "\n";
    for (auto& i : n.source)
    {
        out << " " << i; 
    }
    out << "\n";
    return out;
}
