package com.study.springboot;

public class User
{
    private String id;
    private String password;
    private int age;
    private String preference;

    public User() {}
    
    public User(String id, String password, int age, String preference) {
        this.id = id;
        this.password = password;
        this.age = age;
        this.preference = preference;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPreference() {
        return preference;
    }

    public void setPreference(String preference) {
        this.preference = preference;
    }
}
