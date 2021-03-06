package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> adsByUser(long userId);

    Ad editAdTitle(long id, String title);
    Ad editAdDescription(long id, String description);
    Ad deleteAd(long id);
    List<Ad> search(String query);

    Ad findById(long id);
}
