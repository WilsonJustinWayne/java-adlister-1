package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.util.DaoUtil;

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
