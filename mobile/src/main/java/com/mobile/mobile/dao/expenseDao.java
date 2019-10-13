package com.mobile.mobile.dao;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mobile.mobile.entity.otherexpenses;

@Transactional
@Repository
public class expenseDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public List<otherexpenses> getExpense(String purpose, String start, String end)
    {
        String sql = "SELECT * FROM otherexpenses WHERE 2 > 1";
        if(!purpose.isEmpty())
        {
            sql += " AND purpose LIKE \'%" + purpose + "%\'";
        }
        sql += " AND date>= \'" + start + "\' AND date<= \'" + end + "\'";
        sql = sql + ";";
        RowMapper<otherexpenses> rowMapper = new BeanPropertyRowMapper<otherexpenses>(otherexpenses.class);
        System.out.println(sql);
        return jdbcTemplate.query(sql,rowMapper);
    }
    public String addExpense(String purpose, Date date, int cost)
    {
        String sql = "INSERT INTO otherexpenses(purpose,date,cost) VALUES (?,?,?);";
        jdbcTemplate.update(sql, purpose, date, cost);
        return "Added";
    }
}