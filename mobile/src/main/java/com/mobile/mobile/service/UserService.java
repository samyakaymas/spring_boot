package com.mobile.mobile.service;

import com.mobile.mobile.entity.users;

public interface UserService {
    void save(users user);

    users findByUsername(String username);
}