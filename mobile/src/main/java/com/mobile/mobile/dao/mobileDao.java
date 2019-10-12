package com.mobile.mobile.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.mobiles;
import com.mobile.mobile.entity.brand;
import com.mobile.mobile.entity.colors;
@Transactional
@Repository
public class mobileDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<colors> getColor(String model)
    {
        String sql = "SELECT * FROM colors WHERE model = \'" + model + "\';";
        RowMapper<colors> rowMapper = new BeanPropertyRowMapper<colors>(colors.class);
        return jdbcTemplate.query(sql, rowMapper);
    }
    public List<mobiles> getMobiles(String model, String b_name, String name, String sorting, boolean reverse)
    {
        String sql = "SELECT model,name,b_name,display,screen,resolution,fcamera,rcamera,bluetooth,wifi,network,exmemory,fcharge,usb,battery,ram,gpu,cpu,platform,dualsim,smemory,price FROM mobiles WHERE 2 > 1";
        if(!model.isEmpty())
        {
            sql += " AND model LIKE \'%" + model + "%\'";
        }
        if(!b_name.isEmpty())
        {
            sql += " AND b_name = \'" + b_name + "\'";
        }
        if(!name.isEmpty())
        {
            sql += " AND name LIKE \'%" + name + "%\'";
        }
        if(!sorting.isEmpty())
        {
            sql += " ORDER BY " + sorting;
        }
        sql = sql + ";";
        RowMapper<mobiles> rowMapper = new BeanPropertyRowMapper<mobiles>(mobiles.class);
        System.out.println(sql);
        List<mobiles> list = this.jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            list.get(i).setColor(this.getColor(list.get(i).getModel()));
        }
        return list;
    }
    public List<brand> getAllBrands()
    {
        String sql = "SELECT name,brank FROM brand;";
        RowMapper<brand> rowMapper = new BeanPropertyRowMapper<brand>(brand.class);
        return this.jdbcTemplate.query(sql,rowMapper);
    }
    public boolean brandExist(String name)
    {
        String sql = "SELECT count(*) FROM brand WHERE name = \'" + name + "\';";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        if(count>0)
        {
            return true;
        }
        return false;

    }
    public String addBrand(String name)
    {
        if(name.equals(""))
        {
            return "Empty Name";
        }
        if(brandExist(name))
        {
            return "Brand already exists";
        }
        String sql = "INSERT INTO brand VALUES (\'" + name +"\',0)";
        jdbcTemplate.update(sql);
        return "Success";
    }
    public String delBrand(String name)
    {
        if(brandExist(name))
        {
            String sql = "DELETE FROM brand WHERE name = ? ";
            jdbcTemplate.update(sql, name);
            return "Brand Deleted";
        }
        return "Brand does not exists";
    }
    public void update_price(String model, int price)
    {
        String sql = "UPDATE mobiles SET price = ? WHERE model = ?";
        jdbcTemplate.update(sql,price,model);
    }
    public String add_mobile(List<String> colors,String brand,String name,String model,int price,String display,String resolution,Double wifi,String network,String fcharge,String gpu,String cpu,String platform,String dualsim,Double screen,int fcamera,int rcamera,Double bluetooth,int smemory,int ram,int battery,int exmemory,Double usb)
    {
        String sql = "SELECT count(*) FROM mobiles WHERE model = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, model);
        if(count==0)
        {
            sql = "INSERT INTO mobiles(b_name,name,model,price,display,resolution,wifi,network,fcharge,gpu,cpu,platform,dualsim,screen,fcamera,rcamera,bluetooth,smemory,ram,battery,exmemory,usb) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,brand,name,model,price,display,resolution,wifi,network,fcharge,gpu,cpu,platform,dualsim,screen,fcamera,rcamera,bluetooth,smemory,ram,battery,exmemory,usb);
            for(int i=0;i<colors.size();i++)
            {
                jdbcTemplate.update("INSERT INTO colors(color,model) VALUES (?,?)",colors.get(i),model);
            }
            return "Mobile Added";
        }
        return "Model Exists";
    }
    public String delete_mobile(String model)
    {
        jdbcTemplate.update("DELETE FROM mobiles WHERE model = ?",model);
        jdbcTemplate.update("DELETE FROM colors WHERE model = ?",model);
        return "Deleted";
    }

}