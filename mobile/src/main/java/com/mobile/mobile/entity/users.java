package com.mobile.mobile.entity;

public class users{
    private String username;
    private String password;
    private int sid;

    public int getSid()
    {
        return sid;
    }
    public void setSid(int sid)
    {
        this.sid = sid;
    }
    public String getUsername()
    {
        return this.username;
    }
    public void setUsername(String username)
    {
        this.username=username;
    }
    public String getPassword()
    {
        return this.password;
    }
    public void setPassword(String password)
    {
        this.password=password;
    }
}