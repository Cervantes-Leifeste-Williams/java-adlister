
package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


//@WebServlet(name = "viewAnAdServlet", urlPatterns = "/viewAnAd")
//public class viewAnAdServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        request.getRequestDispatcher("viewAnAd.jsp", ).
//
//    }
//}



@WebServlet(name = "controller.UpdateAdServlet", urlPatterns = "/updateAd")
public class viewAnAdServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long adId = Long.parseLong(request.getParameter("adToUpdate"));
        Ad ad = DaoFactory.getAdsDao().findById(adId);
        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ads/viewAnAd.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().getAttribute("adToUpdate");
        long adId = Long.parseLong(request.getParameter("adToUpdate"));
        request.setAttribute("title", DaoFactory.getAdsDao().editAdTitle(adId, "title"));
        request.setAttribute("description", DaoFactory.getAdsDao().editAdDescription(adId, "description"));
//            req.setAttribute("category", DaoFactory.getAdsDao().findById(adId));
        String updateAd = request.getParameter("adToUpdate");
        String adTitle = request.getParameter("title");
        String adDescription = request.getParameter("description");
        System.out.println("updateAd = " + updateAd);
        System.out.println( adId);
        Ad updateTitle = DaoFactory.getAdsDao().editAdTitle(adId, adTitle);
        response.sendRedirect("/ads");
        Ad updateDescription = DaoFactory.getAdsDao().editAdDescription(adId, adDescription);
        response.sendRedirect("/ads");
    }
}

