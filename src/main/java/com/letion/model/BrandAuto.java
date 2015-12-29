package com.letion.model;

import javax.persistence.*;

@Entity
@Table(name = "brand_auto")
public class BrandAuto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name_brand_auto")
    private String name;
    @Column(name = "url_brand_auto")
    private String url;

    public BrandAuto() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
