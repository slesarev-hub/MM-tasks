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

void lock_if_not_null(std::shared_ptr<Node> node)
{
    if (node != nullptr)
    {
        node->lock();
    }
}

void unlock_if_not_null(std::shared_ptr<Node> node)
{
    if (node != nullptr)
    {
        node->unlock();
    }
}

std::pair<std::shared_ptr<Node>,
          std::shared_ptr<Node>> find_position(const Table& tbl, int key) 
{
    auto fst_node = tbl.head;
    fst_node->lock();
    auto snd_node = tbl.head->get_next();
    while(snd_node != nullptr)
    {
        snd_node->lock();
        if (snd_node->get_key() >= key)
        {
            break;
        }
        fst_node->unlock();
        fst_node = snd_node;
        snd_node = snd_node->get_next();
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
    unlock_if_not_null(fst_node);
    unlock_if_not_null(snd_node);
}

void Table::remove(const Data& data)
{
    int key = Table::hash(data);
    auto [fst_node, snd_node] = find_position(*this, key); // nodes were locked in function

    if ((snd_node != nullptr) && (snd_node->get_key() == key) && snd_node->is_stored(data))
    {
        snd_node->erase(snd_node->find(data));
        this->data_count--;
        if (snd_node->size() == 0)
        {
            //if (fst_node != nullptr)
            //{
                this->mtx.lock();
                //fst_node->set_next(snd_node->get_next());
                this->mtx.unlock();
            //}
            this->node_count--;
        }
    }
    unlock_if_not_null(fst_node);
    unlock_if_not_null(snd_node);
}

void Table::check(const Data& data) const
{
    int key = Table::hash(data);
    auto [fst_node, snd_node] = find_position(*this, key);
    bool result = (fst_node->get_key() == key) && (fst_node->is_stored(data));
    if (fst_node != nullptr)
    {
        fst_node->unlock();
    }
    if (snd_node != nullptr)
    {
        snd_node->unlock();
    }
    this->mtx.lock();
    if (result)
    {
        //std::cout << data.get_int() << " found\n";
    }
    else
    {
        //std::cout << data.get_int() << " not found\n";
    }
    this->mtx.unlock();
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