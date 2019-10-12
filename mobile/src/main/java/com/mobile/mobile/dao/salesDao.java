package com.mobile.mobile.dao;

import java.sql.Date;
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
import com.mobile.mobile.entity.mobiles;

@Transactional
@Repository
public class salesDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    // public List<sales> getSales(int sid, String moa, String start, String end)
    // {
    //     String sql = "SELECT * FROM purchases WHERE 2 > 1";
    //     if(sid!=0)
    //     {
    //         sql += " AND sid = " + sid;
    //     }
    //     if(!moa.isEmpty())
    //     {
    //         sql += " AND moa = \'" + moa + "\'";
    //     }
    //     sql += " AND date>= \'" + start + "\' AND date<= \'" + end + "\'";
    //     sql = sql + ";";
    //     RowMapper<purchases> rowMapper = new BeanPropertyRowMapper<purchases>(purchases.class);
    //     System.out.println(sql);
    //     List<purchases> list = jdbcTemplate.query(sql,rowMapper);
    //     for(int i=0;i<list.size();i++)
    //     {
    //         String sql2 = "SELECT * FROM pdescription WHERE pid = " + list.get(i).getId();
    //         RowMapper<pdescription> rowMapper2 = new BeanPropertyRowMapper<pdescription>(pdescription.class);
    //         list.get(i).setDesc(jdbcTemplate.query(sql2,rowMapper2));
    //     }
    //     return list;
    // }
    // public boolean idExist(Long id)
    // {
    //     String sql = "SELECT COUNT(*) FROM pdescription WHERE id = " + id + ";";
    //     int count = jdbcTemplate.queryForObject(sql,Integer.class);
    //     return count>0;
    // }
    public String addSale(int cid, int sid, String moa, Date date, List<Long> ids, List<Integer> prices)
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
}