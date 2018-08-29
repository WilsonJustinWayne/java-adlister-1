package com.codeup.adlister.dao;

import com.codeup.adlister.util.DaoUtil;

import java.sql.SQLException;

public class MySQLAdsCategoriesDao implements AdsCategories {

    public MySQLAdsCategoriesDao(Config config) {

        DaoUtil.connect(config);
    }

    @Override
    public void insert(long adId, long catId) {
        try {
            DaoUtil.dbInsert(adId, catId);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new adCat.", e);
        }
    }
}
