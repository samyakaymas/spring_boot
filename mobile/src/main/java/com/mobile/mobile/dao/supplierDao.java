package com.mobile.mobile.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.supplier;
import com.mobile.mobile.entity.supplier_number;
@Transactional
@Repository
public class supplierDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<supplier> getSuppliers(String name)
    {
        String sql = "SELECT * FROM supplier WHERE 2 > 1";
        if(!name.isEmpty())
        {
            sql += " AND name LIKE \'%" + name + "%\'";
        }
        sql = sql + ";";
        RowMapper<supplier> rowMapper = new BeanPropertyRowMapper<supplier>(supplier.class);
        System.out.println(sql);
        List<supplier> list = jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            String sql2 = "SELECT * FROM supplier_number WHERE id = " + list.get(i).getId();
            RowMapper<supplier_number> rowMapper2 = new BeanPropertyRowMapper<supplier_number>(supplier_number.class);
            list.get(i).setNumber(jdbcTemplate.query(sql2,rowMapper2));
        }
        return list;
    }
    public boolean supplierExist(String name)
    {
        String sql = "SELECT COUNT(*) FROM supplier WHERE name = \'" + name + "\';";
        int count = jdbcTemplate.queryForObject(sql,Integer.class);
        return count>0;
    }
    public String addSupplier(String name, String address, List<Long> numbers)
    {
        if(supplierExist(name))
        {
            return "Supplier Already Exists";
        }
        String sql = "INSERT INTO supplier(name,address) VALUES (?,?)";
        jdbcTemplate.update(sql, name, address);
        int id = jdbcTemplate.queryForObject("SELECT id FROM supplier WHERE name = \'" + name + "\';", Integer.class);
        for(int i=0;i<numbers.size();i++)
        {
            //System.out.println(numbers.get(i).getClass());
            jdbcTemplate.update("INSERT INTO supplier_number(id,number) VALUES (?,?)", id, numbers.get(i));
        }
        return "Added";
    }
    public String deleteSupplier(int id)
    {
        String sql = "DELETE FROM supplier WHERE id = ?";
        jdbcTemplate.update(sql, id);
        sql = "DELETE FROM supplier_number WHERE id = ?";
        jdbcTemplate.update(sql, id);
        return "Deleted";
    }
}