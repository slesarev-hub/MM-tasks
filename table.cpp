#include "table.hpp"

Table::Table()
    : data_count(0), node_count(0), head(std::make_shared<Node>(Node())){}

Table::~Table(){}

int Table::hash(const Data& data)
{
    return data.get_int() % 100;
}

bool Table::is_empty()
{
    return ((node_count == 0) && (data_count == 0));
}

void Table::put(Data& data)
{
    int  key  = Table::hash(data);
    auto curr = this->head;
    this->mtx.lock();
    while((key > curr->get_key()) && (curr->get_next() != nullptr))
    {
        curr = curr->get_next();
    }
    curr->lock();
    if (curr->get_next() != nullptr)
    {
        curr->get_next()->lock();
    }
    this->mtx.unlock();

    if (key == curr->get_key())
    {
        curr->add_source(data);
        this->data_count++;
    }
    else 
    {
        auto new_node = std::make_shared<Node>(Node(data,
                                                    curr,
                                                    curr->get_next(),
                                                    key));
        curr->set_next(new_node);
        if (curr->get_next() != nullptr)
        {
            curr->get_next()->set_prev(new_node);
            curr->get_next()->unlock();
        }
        this->data_count++;
        this->node_count++;
    }
    curr->unlock();
}