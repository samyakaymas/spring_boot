package com.mobile.mobile.dao;

import java.util.List;
import com.mobile.mobile.entity.users;
public interface IusersDao {
    boolean userExist(String username);
    users getUserByName(String username);
    List<users> getAllUser();
    public void insert(users user);
}