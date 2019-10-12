package com.mobile.mobile.service;

import com.mobile.mobile.entity.users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void save(users user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        jdbcTemplate.update("insert into users(username,password,sid) values(?,?,?)", user.getUsername(),user.getPassword(),user.getSid());
        String sql="insert into user_role values (?,?)";
        jdbcTemplate.update(sql,user.getUsername(),"SALESMAN");
    }

    @Override
    public users findByUsername(String username) {
            String sql = "SELECT username, password, sid FROM users WHERE username = ?";
            RowMapper<users> rowMapper = new BeanPropertyRowMapper<users>(users.class);
            users u = jdbcTemplate.queryForObject(sql, rowMapper, username);
            return u;
    }
}
