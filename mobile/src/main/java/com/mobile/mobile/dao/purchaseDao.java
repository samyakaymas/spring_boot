package com.mobile.mobile.dao;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.purchases;
import com.mobile.mobile.entity.pdescription;

@Transactional
@Repository
public class purchaseDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<purchases> getPurchase(int sid, String moa, String start, String end)
    {
        String sql = "SELECT * FROM purchases WHERE 2 > 1";
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
        RowMapper<purchases> rowMapper = new BeanPropertyRowMapper<purchases>(purchases.class);
        System.out.println(sql);
        List<purchases> list = jdbcTemplate.query(sql,rowMapper);
        for(int i=0;i<list.size();i++)
        {
            String sql2 = "SELECT * FROM pdescription WHERE pid = " + list.get(i).getId();
            RowMapper<pdescription> rowMapper2 = new BeanPropertyRowMapper<pdescription>(pdescription.class);
            list.get(i).setDesc(jdbcTemplate.query(sql2,rowMapper2));
        }
        return list;
    }
    public boolean idExist(Long id)
    {
        String sql = "SELECT COUNT(*) FROM pdescription WHERE id = " + id + ";";
        int count = jdbcTemplate.queryForObject(sql,Integer.class);
        return count>0;
    }
    public String addPurchase(int sid, String moa, Date date, List<Long> ids, List<Integer> prices, List<String> models)
    {
        if(ids.size()==0)
        {
            return "No model added";
        }
        for(int i=0;i<ids.size();i++)
        {
            if(idExist(ids.get(i)))
            {
                return "IMEI/ID Already Exists";
            }
        }
        int id = jdbcTemplate.queryForObject("SELECT count(*) FROM purchases;", Integer.class);
        id++;
        String sql = "INSERT INTO purchases(id,date,moa,sid) VALUES (?,?,?,?);";
        jdbcTemplate.update(sql, id, date, moa, sid);
        for(int i=0;i<ids.size();i++)
        {
            jdbcTemplate.update("INSERT INTO pdescription(id,pid,cost,model) VALUES (?,?,?,?);", ids.get(i), id, prices.get(i), models.get(i) );
            if(moa.equals("mobile"))
            {
                int sellprice = jdbcTemplate.queryForObject("SELECT price FROM mobiles WHERE model = \'" + models.get(i) + "\'",Integer.class);
                jdbcTemplate.update("INSERT INTO mstock(id,model,CostPrice,SellingPrice) VALUES (?,?,?,?);", ids.get(i),models.get(i),prices.get(i),sellprice);
            }
            else{
                int sellprice = jdbcTemplate.queryForObject("SELECT price FROM accessories WHERE model = \'" + models.get(i) + "\'",Integer.class);
                jdbcTemplate.update("INSERT INTO astock(id,model,cost_price,sell_price) VALUES (?,?,?,?);", ids.get(i),models.get(i),prices.get(i),sellprice);
            }
        }
        return "Added";
    }
}