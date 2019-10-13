package com.mobile.mobile.dao;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.customer;
import com.mobile.mobile.entity.customer_number;

@Transactional
@Repository
public class customerDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<customer> getCustomer(String name, String address, String dob)
    {
        String sql = "SELECT * FROM customer WHERE 2 > 1";
        if(!name.isEmpty())
        {
            sql += " AND name LIKE \'%" + name + "%\'";
        }
        if(!address.isEmpty())
        {
            sql += " AND address LIKE \'%" + address + "%\'";
        }
        if(!dob.isEmpty())
        {
            sql += " AND SUBSTRING(dob,4,10) LIKE \'%" + dob.substring(4,10) + "\'";
        }
        sql = sql + ";";
        RowMapper<customer> rowMapper = new BeanPropertyRowMapper<customer>(customer.class);
        System.out.println(sql);
        List<customer> list = jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            String sql2 = "SELECT * FROM customer_number WHERE id = " + list.get(i).getId();
            RowMapper<customer_number> rowMapper2 = new BeanPropertyRowMapper<customer_number>(customer_number.class);
            list.get(i).setNumber(jdbcTemplate.query(sql2,rowMapper2));
            String sql3 = "SELECT COUNT(*) FROM reference WHERE reference_by = " + list.get(i).getId();
            list.get(i).setNor(jdbcTemplate.queryForObject(sql3,Integer.class));
        }
        return list;
    }
    public String addCustomer(String name, String address, Date dob, int reference, List<Long> numbers)
    {
        for(int i=0;i<numbers.size();i++)
        {
            int count = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM customer_number where number = " + numbers.get(i),Integer.class);
            if(count>0)
            {
                return "Mobile Already Added";
            }
        }
        int id = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM customer;", Integer.class);
        id++;
        String sql = "INSERT INTO customer(id,name,address,dob) VALUES (?,?,?,?);";
        jdbcTemplate.update(sql, id, name, address, dob);
        for(int i=0;i<numbers.size();i++)
        {
            jdbcTemplate.update("INSERT INTO customer_number(id,number) VALUES (?,?);", id, numbers.get(i));
        }
        jdbcTemplate.update("INSERT INTO reference VALUES(?,?)",id,reference);
        return "Added";
    }  
}