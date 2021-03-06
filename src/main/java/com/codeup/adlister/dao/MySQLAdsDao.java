package com.codeup.adlister.dao;

import com.codeup.adlister.controllers.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;


    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> adsByUser(long userId) {
        PreparedStatement stmt = null;
        try {
            String insertQuery = "SELECT * FROM ads WHERE user_id = ?";
            stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving your ads.", e);
        }
    }
//ALTERNATE METHOD TO DISPLAY USER_ADS
//    @Override
//    public List<Ad> adsByUser(long userId) {
//        List<Ad> userAds = new ArrayList<>();
//        PreparedStatement stmt = null;
//        try {
//            String insertQuery = "SELECT * FROM ads WHERE user_id = ?";
//            stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
//            stmt.setLong(1, userId);
//            ResultSet rs = stmt.executeQuery();
//            while(rs.next()){
//                userAds.add(new Ad(rs.getLong("id"), rs.getLong("user_id"), rs.getString("title"), rs.getString("description")));
//            }
////            return createAdsFromResults(rs);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error retrieving your ads.", e);
//        }
//        return userAds;
//    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public Ad findById(long id) {
        String idQuery = "SELECT * FROM ads WHERE id = ?";
        try{
            PreparedStatement statement = connection.prepareStatement(idQuery);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            if (! rs.next()) {
                return null;
            }
            return extractAd(rs);
        }catch(SQLException e){
            throw new RuntimeException("Error finding the ad id", e);
        }
    }
    @Override
    public Ad editAdTitle(long id, String title) {
        findById(id);
        String editAdQuery = "UPDATE ads SET title = ? WHERE id = ? ";
        try{
            PreparedStatement statement = connection.prepareStatement(editAdQuery);
            statement.setString(1, title);
            statement.setLong(2, id);
            statement.executeUpdate();
            return null;
        }catch(SQLException e){
            throw new RuntimeException("Error updating the ad title", e);
        }
    }
    @Override
    public Ad editAdDescription(long id, String description) {
        findById(id);
        String editAdQuery = "UPDATE ads SET description = ? WHERE id = ? ";
        try{
            PreparedStatement statement = connection.prepareStatement(editAdQuery);
            statement.setString(1, description);
            statement.setLong(2, id);
            statement.executeUpdate();
            return null;
        }catch(SQLException e){
            throw new RuntimeException("Error updating the ad description", e);
        }
    }
    @Override
    public Ad deleteAd(long id){
        findById(id);
        try{
        String deleteAdQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(deleteAdQuery, Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, id);
            statement.executeUpdate();
            boolean confirmDeletion = statement.execute();
            return null;
        }catch(SQLException e){
            throw new RuntimeException("Error. Unable to delete ad.", e);
        }
    }

    @Override
    public List<Ad> search(String query) {
    PreparedStatement stmt = null;
        try {
                stmt = connection.prepareStatement("SELECT * FROM ads WHERE title LIKE ? OR description LIKE ?");
                stmt.setString(1, '%' + query + '%');
                stmt.setString(2, '%' + query + '%');
                ResultSet rs = stmt.executeQuery();
                return createAdsFromResults(rs);
                } catch (SQLException e) {
                throw new RuntimeException("Error retrieving search.", e);
                }
                }

//    public delete(Long id) {
//        List<Ad> ads = new ArrayList<>();
//        try {
//            String insertQuery = "DELETE FROM ads WHERE id = ?";
//            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
//            stmt.setLong(1, id);
//            stmt.executeUpdate();
//        } catch (SQLException e) {
//            throw new RuntimeException("Error deleting product #" + id, e);
//        }
//        return null;
    //}

}
