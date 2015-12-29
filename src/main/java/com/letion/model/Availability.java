package com.letion.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "availability")
public class Availability implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "availability")
    private String availability;

    public Availability() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }
}
