package com.mobile.mobile.dao;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.sales;
import com.mobile.mobile.entity.sdescription;
import com.mobile.mobile.entity.mstock;
import com.mobile.mobile.entity.astock;
import com.mobile.mobile.entity.datapoint;

@Transactional
@Repository
public class salesDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<sales> getSales(int sid, String moa, String start, String end)
    {
        String sql = "SELECT * FROM sales WHERE 2 > 1";
        if(sid!=0)
        {
            sql += " AND sid = " + sid;
        }
        if(!moa.isEmpty())
        {
            sql += " AND moa = \'" + moa + "\'";
        }
        sql += " AND date>= \'" + start + "\' AND date<= \'" + end + "\'";
        sql = sql + ";";
        RowMapper<sales> rowMapper = new BeanPropertyRowMapper<sales>(sales.class);
        System.out.println(sql);
        List<sales> list = jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            String sql2 = "SELECT * FROM sdescription WHERE sid = " + list.get(i).getId();
            RowMapper<sdescription> rowMapper2 = new BeanPropertyRowMapper<sdescription>(sdescription.class);
            list.get(i).setDesc(jdbcTemplate.query(sql2,rowMapper2));
        }
        return list;
    }
    public String addSale(int cid, String username, String moa, java.sql.Date date, List<Long> ids, List<Integer> prices)
    {
        if(ids.size()==0)
        {
            return "No model added";
        }
        int id = jdbcTemplate.queryForObject("SELECT count(*) FROM sales;", Integer.class);
        id++;
        int price = 0;
        for(int i=0;i<prices.size();i++)
        {
            price += prices.get(i);
        }
        int sid = jdbcTemplate.queryForObject("SELECT sid FROM users WHERE username = \'"+username+"\'", Integer.class);
        String sql = "INSERT INTO sales(id,date,moa,sell_price,cid,sid) VALUES (?,?,?,?,?,?);";
        jdbcTemplate.update(sql, id, date, moa, price, cid, sid);
        for(int i=0;i<ids.size();i++)
        {
            if(moa.equals("mobile"))
            {
                String model = jdbcTemplate.queryForObject("SELECT model FROM mstock WHERE id = " + ids.get(i),String.class);
                jdbcTemplate.update("INSERT INTO sdescription(id,model,sell_price,sid) VALUES (?,?,?,?);", ids.get(i), model, prices.get(i), id);
                jdbcTemplate.update("DELETE FROM mstock WHERE id = ?",ids.get(i));
            }
            else{
                String model = jdbcTemplate.queryForObject("SELECT model FROM astock WHERE id = " + ids.get(i),String.class);
                jdbcTemplate.update("INSERT INTO sdescription(id,model,sell_price,sid) VALUES (?,?,?,?);", ids.get(i), model, prices.get(i), id);
                jdbcTemplate.update("DELETE FROM astock WHERE id = ?",ids.get(i));
            }
        }
        jdbcTemplate.update("UPDATE salesman SET sale_value = sale_value + ? WHERE id = ?",price,sid);
        jdbcTemplate.update("UPDATE salesman SET sale_units = sale_units + ? WHERE id = ?",ids.size(),sid); 
        return "Added";
    }
    public List<mstock> getMstock()
    {
        String sql = "SELECT CONCAT(m.b_name,' ',m.name) as name, s.CostPrice as CostPrice, s.SellingPrice as SellingPrice, s.id as id, s.model as model FROM mobiles m, mstock s WHERE m.model = s.model";
        RowMapper<mstock> rowMapper = new BeanPropertyRowMapper<mstock>(mstock.class);
        return jdbcTemplate.query(sql,rowMapper);
    }
    public List<astock> getAstock()
    {
        String sql = "SELECT CONCAT(a.brand,' ',a.name) as name, s.cost_price as cost_price, s.sell_price as sell_price, s.id as id, s.model as model FROM accessories a, astock s WHERE a.model = s.model";
        RowMapper<astock> rowMapper = new BeanPropertyRowMapper<astock>(astock.class);
        return jdbcTemplate.query(sql,rowMapper);
    }
    public int getSellValue(String date)
    {
        String sql = "SELECT COALESCE(SUM(sell_price),0) FROM sales WHERE date = \'" + date + "\'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    public List<datapoint> getData()
    {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        List<datapoint> list = new ArrayList<datapoint>();
        Calendar cal  = Calendar.getInstance();
        for(int i=0;i<7;i++)
        {
            datapoint k = new datapoint();
            k.x = i;
            String dd = sm.format(date);
            k.y = getSellValue(dd);
            cal.add(Calendar.DAY_OF_YEAR,-1);
            Date prev = cal.getTime();
            date = prev;
            k.date = date;
            list.add(k);
        }
        return list;
    }
    public int getSSellValue(String date, int sid)
    {
        String sql = "SELECT COALESCE(SUM(sell_price),0) FROM sales WHERE date = \'" + date + "\' AND sid = " + sid;
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    public List<datapoint> getSData(String username)
    {
        int sid = jdbcTemplate.queryForObject("SELECT sid FROM users WHERE username = \'"+username+"\'", Integer.class);
        java.util.Date date = new java.util.Date();
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        List<datapoint> list = new ArrayList<datapoint>();
        Calendar cal  = Calendar.getInstance();
        for(int i=0;i<7;i++)
        {
            datapoint k = new datapoint();
            k.x = i;
            String dd = sm.format(date);
            k.y = getSSellValue(dd,sid);
            cal.add(Calendar.DAY_OF_YEAR,-1);
            Date prev = cal.getTime();
            date = prev;
            k.date = date;
            list.add(k);
        }
        return list;
    }
}