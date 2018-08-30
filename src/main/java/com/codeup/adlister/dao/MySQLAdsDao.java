package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.util.DaoUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {

    public MySQLAdsDao(Config config) {

        DaoUtil.connect(config);
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = DaoUtil.connection.prepareStatement("SELECT a.id, a.user_id, a.title, a.description, u.username FROM ads AS a JOIN users AS u ON a.user_id = u.id ORDER BY id;");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            return DaoUtil.dbInsert(ad.getUserId(), ad.getTitle(), ad.getDescription());
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public List<Ad> searchAds(String searchTerm) {

        PreparedStatement stmt = null;
        try {
            stmt = DaoUtil.connection.prepareStatement("SELECT * FROM ads JOIN users WHERE ads.title LIKE ?");
            stmt.setString(1, '%' + searchTerm + '%');

            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving specific ads.", e);
        }

    }

    @Override
    public Ad findById(long id) {

        PreparedStatement stmt = null;
        try {
            stmt = DaoUtil.connection.prepareStatement("SELECT * FROM ads JOIN users WHERE ads.id = ?");
            stmt.setLong(1, id);

            ResultSet rs = stmt.executeQuery();

            rs.next();
            return extractAd(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving targeted ad.", e);
        }

    }

    public void updateAd(String title, String description, long id) throws SQLException {

        String updateQuery = "UPDATE ads SET title = ?, description = ? where id = ?";

        PreparedStatement stmt = DaoUtil.connection.prepareStatement(updateQuery);
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setLong(3, id);
        stmt.executeUpdate();

    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                DaoFactory.getAdsCategoriesDao().findByAdId(rs.getLong("id")),
                rs.getString("username")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
