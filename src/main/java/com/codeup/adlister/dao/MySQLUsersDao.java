package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.codeup.adlister.util.DaoUtil;

import java.sql.*;

public class MySQLUsersDao implements Users {
    public MySQLUsersDao(Config config) {

        DaoUtil.connect(config);
    }

    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = DaoUtil.connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {

        try{
        return DaoUtil.dbInsert(user.getUsername(), user.getEmail(), user.getPassword());
        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Duplicate username");
            return null;
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }

}
