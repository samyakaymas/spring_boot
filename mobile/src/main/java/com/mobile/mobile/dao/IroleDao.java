package com.mobile.mobile.dao;

import java.util.List;

import com.mobile.mobile.entity.user_roles;
import com.mobile.mobile.entity.users;

public interface IroleDao {
    List<user_roles> getRolesbyUser(users user);
}