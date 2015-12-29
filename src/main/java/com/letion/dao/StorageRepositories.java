package com.letion.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("singleton")
public class StorageRepositories {
    private   ProductRepository productRepository;

    public StorageRepositories() {
        SessionFactory sessionFactory;
        try {
            sessionFactory = new Configuration()
                    .configure()
                    .buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
        this.productRepository = new ProductRepository(sessionFactory);
    }

    public ProductRepository  getRepository() {
        return productRepository;
    }

}
