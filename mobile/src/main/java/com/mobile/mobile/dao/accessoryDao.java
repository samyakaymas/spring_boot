package com.mobile.mobile.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.accessories;
import com.mobile.mobile.entity.aspecs;
@Transactional
@Repository
public class accessoryDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<aspecs> getSpec(String model)
    {
        String sql = "SELECT * FROM aspecs WHERE model = \'" + model + "\';";
        RowMapper<aspecs> rowMapper = new BeanPropertyRowMapper<aspecs>(aspecs.class);
        return jdbcTemplate.query(sql,rowMapper);
    }
    public List<accessories>getTypes()
    {
        String sql = "SELECT DISTINCT(type) as type FROM accessories";
        RowMapper<accessories> rowMapper = new BeanPropertyRowMapper<accessories>(accessories.class);
        return jdbcTemplate.query(sql,rowMapper);
    }
    public List<accessories> getAccessories(String model, String name, String type, String brand)
    {
        String sql = "SELECT * FROM accessories WHERE 2 > 1";
        if(!model.isEmpty())
        {
            sql += " AND model LIKE \'%" + model + "%\'";
        }
        if(!brand.isEmpty())
        {
            sql += " AND brand = \'" + brand + "\'";
        }
        if(!type.isEmpty())
        {
            sql += " AND type = \'" + type + "\'";
        }
        if(!name.isEmpty())
        {
            sql += " AND name LIKE \'%" + name + "%\'";
        }
        sql = sql + ";";
        RowMapper<accessories> rowMapper = new BeanPropertyRowMapper<accessories>(accessories.class);
        System.out.println(sql);
        List<accessories> list = jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            
            list.get(i).setSpecs(this.getSpec(list.get(i).getModel()));
        }
        return list;
    }
    public boolean accessoryExist(String model)
    {
        String sql = "SELECT COUNT(*) FROM accessories WHERE model = \'" + model + "\';";
        int count = jdbcTemplate.queryForObject(sql,Integer.class);
        return count>0;
    }
    public String addAccessory(String model, String brand, String name, String type,int price, List<String> description)
    {
        if(accessoryExist(model))
        {
            return "Model Already Exists";
        }
        String sql = "INSERT INTO accessories(model,brand,name,type,price) VALUES (?,?,?,?,?)";
        jdbcTemplate.update(sql, model,brand,name,type,price);
        System.out.println(description.size());
        for(int i=0;i<description.size();i++)
        {
            jdbcTemplate.update("INSERT INTO aspecs(model,specs) VALUES (?,?);", model, description.get(i));
        }
        return "Added";
    }
    public String delAccessory(String model)
    {
        jdbcTemplate.update("DELETE from accessories WHERE model = ?", model);
        jdbcTemplate.update("DELETE from aspecs WHERE model = ?", model);
        return "Deleted";
    }
}