package com.mobile.mobile.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.mobile.mobile.entity.users;
// import com.mobile.mobile.entity.userRM;

@Transactional
@Repository
public class usersDao implements IusersDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
        @Override
        public boolean userExist(String username)
        {
            String sql = "SELECT count(*) FROM users WHERE username = ?";
            int count = jdbcTemplate.queryForObject(sql, Integer.class, username);
            return count>0;
        }
        @Override
        public users getUserByName(String username)
        {
            String sql = "SELECT username, password FROM users WHERE username = ?";
            RowMapper<users> rowMapper = new BeanPropertyRowMapper<users>(users.class);
            users u = jdbcTemplate.queryForObject(sql, rowMapper, username);
            return u;
        }
        @Override
        public List<users> getAllUser()
        {
            String sql = "SELECT username,password FROM users";
            RowMapper<users> rowMapper = new BeanPropertyRowMapper<users>(users.class);
            return this.jdbcTemplate.query(sql,rowMapper);
        }
        @Override
        public void insert(users user)
        {
            if(this.userExist(user.getUsername()))
            {
                System.out.println("Already Exists");
            }
            else
            {
                String sql = "INSERT INTO users (username,password) VALUES ( ? , ? )";
                jdbcTemplate.update(sql,user.getUsername(),user.getPassword());
                sql = "INSERT INTO user_roles (username,role) VALUES ( ? , ? )";
                jdbcTemplate.update(sql,user.getUsername(),"SALE");
            }
        }

}