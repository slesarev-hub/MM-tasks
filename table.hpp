#ifndef TABLE_H
#define TABLE_H

#include "node.hpp"

#include <atomic>

class Table
{
public: 
    Table();
    ~Table();
    Table(Table& other) = delete;

    static int hash(const Data& data);

    bool is_empty();

    void put(const Data& data);
    void remove(const Data& data);
    bool check(const Data& data);

    friend std::ostream& operator<<(std::ostream& out, const Table& t);
    friend std::pair<std::shared_ptr<Node>, std::shared_ptr<Node>> find_position(const Table& tbl, int key);

private:
    std::atomic<int> data_count;
    std::atomic<int> node_count;

    std::shared_ptr<Node> head;    
    mutable std::mutex mtx;

};

#endif