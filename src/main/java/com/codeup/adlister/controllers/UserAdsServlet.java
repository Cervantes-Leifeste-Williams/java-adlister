package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.UserAdsServlet", urlPatterns = "/ads/usersAds")
public class UserAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    User user = (User)request.getSession().getAttribute("user");
        request.setAttribute("ads", DaoFactory.getAdsDao().adsByUser(user.getId()));
        request.getRequestDispatcher("/WEB-INF/ads/usersAds.jsp").forward(request, response);
    }
}

