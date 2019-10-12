package com.mobile.mobile.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.mobile.mobile.entity.user_roles;
import com.mobile.mobile.entity.users;
@Transactional
@Repository
public class roleDao implements IroleDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
        @Override
        public List<user_roles> getRolesbyUser(users user)
        {
            String sql = "SELECT user_role_id,username,role FROM user_role WHERE username = ?";
            RowMapper<user_roles> rowMapper = new BeanPropertyRowMapper<user_roles>(user_roles.class);
            return this.jdbcTemplate.query(sql,rowMapper,user.getUsername());
        }

}