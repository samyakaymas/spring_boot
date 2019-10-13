package com.mobile.mobile.dao;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.salesman;
import com.mobile.mobile.entity.salesman_number;
import com.mobile.mobile.entity.users;
import com.mobile.mobile.service.UserService;
@Transactional
@Repository
public class salesmanDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private UserService userService;
    
    public List<salesman> getSalesman(String name, boolean current)
    {
        String sql = "SELECT * FROM salesman WHERE 2 > 1";
        if(!name.isEmpty())
        {
            sql += " AND name LIKE \'%" + name + "%\'";
        }
        if(current)
        {
            sql += " AND leaving_date IS NULL";
        }
        sql += " ORDER BY sale_value DESC";
        sql = sql + ";";
        RowMapper<salesman> rowMapper = new BeanPropertyRowMapper<salesman>(salesman.class);
        System.out.println(sql);
        List<salesman> list = jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            String sql2 = "SELECT * FROM salesman_number WHERE id = " + list.get(i).getId();
            RowMapper<salesman_number> rowMapper2 = new BeanPropertyRowMapper<salesman_number>(salesman_number.class);
            list.get(i).setNumber(jdbcTemplate.query(sql2,rowMapper2));
        }
        return list;
    }
    public boolean salesmanExist(String name)
    {
        String sql = "SELECT COUNT(*) FROM salesman WHERE name = \'" + name + "\';";
        int count = jdbcTemplate.queryForObject(sql,Integer.class);
        return count>0;
    }
    public boolean usernameExist(String username)
    {
        String sql = "SELECT COUNT(*) FROM users WHERE username = \'" + username + "\';";
        int count = jdbcTemplate.queryForObject(sql,Integer.class);
        return count>0;
    }
    public String addSalesman(String name, users user, String address, Date dob, Date join_date, int start_salary, List<Long> numbers)
    {
        if(salesmanExist(name))
        {
            return "Salesman Already Exists";
        }
        if(usernameExist(user.getUsername()))
        {
            return "Username Already Exists";
        }
        String sql = "INSERT INTO salesman(name,address,dob,join_date,start_salary,current_salary,sale_value,sale_units) VALUES (?,?,?,?,?,?,?,?);";
        jdbcTemplate.update(sql, name, address, dob, join_date, start_salary, start_salary, 0, 0);
        int id = jdbcTemplate.queryForObject("SELECT id FROM salesman WHERE name = \'" + name + "\';", Integer.class);
        for(int i=0;i<numbers.size();i++)
        {
            jdbcTemplate.update("INSERT INTO salesman_number(id,number) VALUES (?,?);", id, numbers.get(i));
        }
        user.setSid(id);
        userService.save(user);
        return "Added";
    }
    public String fireSalesman(int id, Date leaving_date)
    {
        String sql = "UPDATE salesman SET leaving_date = ? WHERE id = ?";
        jdbcTemplate.update(sql, leaving_date, id);
        sql = "DELETE FROM users WHERE sid = ?";
        jdbcTemplate.update(sql, id);
        return "Deleted";
    }
    public String updateSalary(String name, Integer salary)
    {
        String sql = "UPDATE salesman SET current_salary = ? WHERE name = ?";
        jdbcTemplate.update(sql, salary, name);
        return "Updated";
    }
}