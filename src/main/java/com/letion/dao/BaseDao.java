package com.letion.dao;

import com.letion.model.OrderList;
import com.letion.model.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface BaseDao {
    public OrderList saveCart(OrderList product) throws ClassNotFoundException, SQLException;

    public Product getById(int id) throws ClassNotFoundException, SQLException;

    public Product getByIdUrl(String idUrl) throws ClassNotFoundException, SQLException;

    public List<Product> getByTypeUrl(String typeUrl) throws ClassNotFoundException, SQLException;

    public List<Product> getAll() throws ClassNotFoundException, SQLException;

    public Product save(Product product) throws ClassNotFoundException, SQLException;

    public Product update(Product product) throws ClassNotFoundException, SQLException;

    public void deleteById(int id) throws ClassNotFoundException, SQLException;

    public Map<String, Map> getSelects() throws ClassNotFoundException, SQLException;
}
