package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.codeup.adlister.util.DaoUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLUsersDao implements Users {
    public MySQLUsersDao(Config config) {

        DaoUtil.connect(config);
    }

    @Override
    public User findByUserId(Long id) {
        String query = "SELECT * FROM users WHERE id = ?";
        PreparedStatement stmt = null;
        try {
            stmt = DaoUtil.connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by ad user_id");
        }
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateUserInformation(String username, String email, String password, Long userId) {
        PreparedStatement stmt = null;
        String query = "UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?";
        try {
            stmt = DaoUtil.connection.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setLong(4, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user information", e);
        }
    }

    private List<User> createUsersFromResults(ResultSet rs) throws SQLException{
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            users.add(extractUser(rs));
        }
        return users;
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
