package com.study.springboot;

// 유저 정보를 담는 클래스 입니다
public class User
{
    private String id;			// 아이디
    private String password;	// 비밀번호
    private int age;			// 나이
    private String preference;	// 취향
    private int rank;			// 등급

    public User() {}
    
    public User(String id, String password, int age, String preference, int rank) {
        this.id = id;
        this.password = password;
        this.age = age;
        this.preference = preference;
        this.rank = rank;
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

	public int getRank()
	{
		return rank;
	}

	public void setRank(int rank)
	{
		this.rank = rank;
	}
}
