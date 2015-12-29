package com.letion.dao;

import com.letion.model.OrderList;
import com.letion.model.Product;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements BaseDao {

    private final SessionFactory sessionFactory;

    public ProductRepository(SessionFactory session) {
        this.sessionFactory = session;
    }

    @Override
    public OrderList saveCart(OrderList order) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(order);
        session.getTransaction().commit();
        return order;
    }

    @Override
    public Product save(Product product) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(product);
        session.getTransaction().commit();
        return product;
    }

    @Override
    public Product getById(int id) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Product p WHERE id = :id_tovar").setInteger("id_tovar", id);
        Product result = (Product) query.uniqueResult();
        session.getTransaction().commit();
        return result;
    }

    @Override
    public Product getByIdUrl(String idUrl) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Product p WHERE url = :idUrl").setString("idUrl", idUrl);
        Product result = (Product) query.uniqueResult();
        session.getTransaction().commit();
        return result;
    }

    @Override
    public List<Product> getByTypeUrl(String typeUrl) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Product p WHERE productType.typeUrl = :typeUrl").setString("typeUrl", typeUrl);
        query.setMaxResults(40);
        List<Product> result = (List<Product>) query.list();
        session.getTransaction().commit();
        return result;
    }

    @Override
    public List<Product> getAll() throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Product p");
        List<Product> result = (List<Product>) query.list();
        session.getTransaction().commit();
        return result;
    }


    @Override
    public Product update(Product product) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.update(product);
        session.getTransaction().commit();
        return product;
    }

    @Override
    public void deleteById(int id) throws ClassNotFoundException, SQLException {

    }

    @Override
    public Map<String, Map> getSelects() throws ClassNotFoundException, SQLException {
        Map<String, Map> result = new HashMap<String, Map>();
        result.put("selectManufacturer", this.getManufacturers());
        result.put("selectType", this.getTypes());
        result.put("selectAvailability", this.getAvailability());
        result.put("selectBrandAuto", this.getBrandAuto());
        return result;
    }

    public Map<Long, String> getSelectData(String queryParam) throws ClassNotFoundException, SQLException {
        Session session = sessionFactory.getCurrentSession();
        Map<String, Map> selectData = new HashMap<String, Map>();
        session.beginTransaction();
        Query query = session.createQuery(queryParam);
        List<Object[]> list = (List<Object[]>) query.list();
        session.getTransaction().commit();
        Map<Long, String> result = new HashMap<>();
        for (Object[] item : list) {
            result.put((Long) item[0], (String) item[1]);
        }
        return result;
    }

    private Map<Long, String> getManufacturers() throws SQLException, ClassNotFoundException {
        Map<Long, String> result = new HashMap<Long, String>();
        result = this.getSelectData("select id, name from Manufacturer");
        return result;

    }

    private Map<Long, String> getTypes() throws SQLException, ClassNotFoundException {
        Map<Long, String> result = new HashMap<Long, String>();
        result = this.getSelectData("select id, name, typeUrl from ProductType");
        return result;

    }

    private Map<Long, String> getAvailability() throws SQLException, ClassNotFoundException {
        Map<Long, String> result = new HashMap<Long, String>();
        result = this.getSelectData("select id, availability  from Availability");
        return result;

    }

    private Map<Long, String> getBrandAuto() throws SQLException, ClassNotFoundException {
        Map<Long, String> result = new HashMap<Long, String>();
        result = this.getSelectData("select id, url from BrandAuto");
        return result;

    }
}

