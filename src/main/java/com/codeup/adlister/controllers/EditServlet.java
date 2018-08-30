package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EditServlet", urlPatterns = "/edit")
public class EditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("ad_id") == null){
            response.sendRedirect("/ads");
        }else{
            long ad_id = Long.parseLong(request.getParameter("ad_id"));

            request.setAttribute("ads", DaoFactory.getAdsDao().findById(ad_id));

            request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("ad_id"));
        String newTitle = request.getParameter("title");
        String newDescription = request.getParameter("description");

        try {
            DaoFactory.getAdsDao().updateAd(newTitle, newDescription, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("/profile");

    }
}
