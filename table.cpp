#include "table.hpp"

Table::Table()
    : data_count(0), node_count(0), head(new Node()){}

Table::~Table(){}

int Table::hash(const Data& data)
{
    return data.get_int() % 100;
}

bool Table::is_empty()
{
    return ((node_count == 0) && (data_count == 0));
}

std::pair<std::shared_ptr<Node>,
          std::shared_ptr<Node>> find_position(const Table& tbl, int key) 
{
    auto fst_node = tbl.head;
    fst_node->lock();
    auto snd_node = fst_node->get_next();
    if (snd_node != nullptr)
    {
        snd_node->lock();
    }
    while((key > fst_node->get_key()) && (snd_node != nullptr) && (key >= snd_node->get_key()))
    {
        if (snd_node->get_next() != nullptr)
        {
            snd_node->get_next()->lock();
        }
        snd_node = snd_node->get_next();
        auto zero_node = fst_node;
        fst_node = fst_node->get_next();
        zero_node->unlock();
    }
    return {fst_node, snd_node};
}

void Table::put(const Data& data)
{
    int key = Table::hash(data);
    auto [fst_node, snd_node] = find_position(*this, key); // nodes were locked in function

    this->data_count++;
    if (key == fst_node->get_key())
    {
        fst_node->add_source(data);
    }
    else 
    {
        auto new_node = std::make_shared<Node>(data,
                                               snd_node,
                                               key);   
        fst_node->set_next(new_node);    
        this->node_count++;
    }
    fst_node->unlock();
    if (snd_node != nullptr)
    {
        snd_node->unlock();
    }
}

void Table::remove(const Data& data)
{
    int key = Table::hash(data);
    auto fst_node = this->head;
    fst_node->lock();
    auto snd_node = fst_node->get_next();
    if (snd_node != nullptr)
    {
        snd_node->lock();
    }
    auto thrd_node = (snd_node == nullptr) ? (nullptr) : (snd_node->get_next());
    if (thrd_node != nullptr)
    {
        thrd_node->lock();
    }
    while((key > fst_node->get_key()) && (snd_node != nullptr) && (key > snd_node->get_key())
                                      && (thrd_node != nullptr) && (key >= thrd_node->get_key()))
    {
        auto zero_node = fst_node;
        fst_node  = snd_node;
        snd_node  = thrd_node;
        if (thrd_node->get_next() != nullptr)
        {
            thrd_node->get_next()->lock();
        }
        thrd_node = thrd_node->get_next();
        zero_node->unlock();
    }

    if ((snd_node != nullptr) && (snd_node->get_key() == key) && snd_node->is_stored(data))
    {
        snd_node->erase(snd_node->find(data));
        this->data_count--;
        if (snd_node->size() == 0)
        {
            if (fst_node != nullptr)
            {
                fst_node->set_next(thrd_node);
            }
            this->node_count--;
        }
    }
    for (auto& i : {fst_node, snd_node, thrd_node})
    {
        if (i != nullptr)
        {
            i->unlock();
        }
    }
}

bool Table::check(const Data& data)
{
    int key = Table::hash(data);
    auto [fst_node, snd_node] = find_position(*this, key);
    bool result = (fst_node->get_key() == key) && (fst_node->is_stored(data));
    fst_node->unlock();
    snd_node->unlock();
    return result;
}

std::ostream& operator<<(std::ostream& out, const Table& t)
{
    out << "data count : " << t.data_count << "\n" 
        << "node count : " << t.node_count << "\n";
    auto node = t.head;
    while(node != nullptr)
    {
        out << *node.get();
        node = node->get_next();
    }
    return out;
}