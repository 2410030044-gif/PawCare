package com.petapp.petapp.model;
import jakarta.persistence.*;
@Entity
public class Pet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String type;
    private int age;
    private String status;
    public int getId() { return id; }
    public String getName() { return name; }
    public String getType() { return type; }
    public int getAge() { return age; }
    public String getStatus() { return status; }
    public void setName(String name) { this.name = name; }
    public void setType(String type) { this.type = type; }
    public void setAge(int age) { this.age = age; }
    public void setStatus(String status) { this.status = status; }
}