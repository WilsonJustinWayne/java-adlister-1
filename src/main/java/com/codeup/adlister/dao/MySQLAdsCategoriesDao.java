package com.codeup.adlister.dao;

import com.codeup.adlister.util.DaoUtil;

public class MySQLAdsCategoriesDao implements AdsCategories {

    public MySQLAdsCategoriesDao(Config config) {

        DaoUtil.connect(config);
    }


    @Override
    public void insert(long adId, long catId) {



    }
}
