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

private:
    std::atomic<int> data_count;
    std::atomic<int> node_count;
   
    std::mutex mtx;

    std::shared_ptr<Node> head; 
};

#endif