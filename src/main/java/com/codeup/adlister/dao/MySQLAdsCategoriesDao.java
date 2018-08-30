package com.codeup.adlister.dao;

import com.codeup.adlister.models.AdCategory;
import com.codeup.adlister.util.DaoUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<AdCategory> findByAdId(long adId) {
        PreparedStatement stmt = null;
        try {
            stmt = DaoUtil.connection.prepareStatement("SELECT * FROM ads_categories WHERE ad_id = ?");
            stmt.setLong(1, adId);

            ResultSet rs = stmt.executeQuery();
            return createCategoriesArrayFromResults(rs);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error retrieving categories array.", e);
        }

    }

    private List<AdCategory> createCategoriesArrayFromResults(ResultSet rs) throws SQLException {
        List<AdCategory> adsCats = new ArrayList<>();
        while (rs.next()) {
            adsCats.add(extractAdCategory(rs));
        }
        return adsCats;
    }

    private AdCategory extractAdCategory(ResultSet rs) throws SQLException {
        return new AdCategory(
                rs.getLong("ad_id"),
                rs.getLong("category_id")
        );
    }
}
