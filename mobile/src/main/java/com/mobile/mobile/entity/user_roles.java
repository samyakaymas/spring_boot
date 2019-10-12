package com.mobile.mobile.entity;

public class user_roles{
    private String username;
    private int user_role_id;
    private String role;
    
    public String getUsername()
    {
        return this.username;
    }
    public void setUsername(String username)
    {
        this.username=username;
    }
    public String getRole()
    {
        return this.role;
    }
    public void setRole(String role)
    {
        this.role=role;
    }
    public int getId()
    {
        return this.user_role_id;
    }
    public void setId(int id)
    {
        this.user_role_id=id;
    }
}