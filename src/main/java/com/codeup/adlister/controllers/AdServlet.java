package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdServlet", urlPatterns = "/ad")
public class AdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adId = Long.valueOf(request.getParameter("id"));
        List<Ad> ads = DaoFactory.getAdsDao().all();

        for (Ad ad: ads) {
            if (ad.getId() == adId) {
                request.setAttribute("ad", ad);
                request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
            }
        }
    }
}
