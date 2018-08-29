package com.codeup.adlister.util;

import com.codeup.adlister.dao.Config;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class DaoUtil {

    public static Connection connection;

    public static void connect(Config config) {

        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    public static long dbInsert(long id, String title, String description) throws SQLException {

        String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, id);
        stmt.setString(2, title);
        stmt.setString(3, description);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);
    }

    public static long dbInsert(String name, String mail, String pass) throws SQLException {

        String insertQuery = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, name);
        stmt.setString(2, mail);
        stmt.setString(3, pass);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);
    }

    public static long dbInsert(long adId, long catId) throws SQLException {

        String insertQuery = "INSERT INTO ads_categories(ad_id, category_id) VALUES (?, ?)";
        PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, adId);
        stmt.setLong(2, catId);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);
    }

    public static long dbDelete(String targetDb, long id) throws SQLException {

        String deleteQuery = "";

        if (targetDb.equals("ads")) {
            deleteQuery = "DELETE FROM ads WHERE id = ?";
        }

        PreparedStatement stmt = connection.prepareStatement(deleteQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setLong(1, id);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        return rs.getLong(1);

    }

}