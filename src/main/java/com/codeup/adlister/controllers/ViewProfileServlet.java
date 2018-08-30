package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.DaoUtil;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("methods").equals("PUT")) {
            User user = (User) request.getSession().getAttribute("user");
            String editedUsername = !request.getParameter("username").equals(user.getUsername())
                    ? request.getParameter("username")
                    : user.getUsername();
            String editedEmail = !request.getParameter("email").equals(user.getEmail())
                    ? request.getParameter("email")
                    : user.getEmail();
            String newPassword = !request.getParameter("password").equals("")
                    ? Password.hash(request.getParameter("password"))
                    : user.getPassword();
            DaoFactory.getUsersDao().updateUserInformation(editedUsername, editedEmail, newPassword, user.getId());
            User newUser = DaoFactory.getUsersDao().findByUserId(user.getId());
            request.getSession().setAttribute("user", newUser);
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } else {
            long ad_id = Long.parseLong(request.getParameter("ad_id"));
            try {
                DaoUtil.dbDelete("ads", ad_id);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        }
    }
}
