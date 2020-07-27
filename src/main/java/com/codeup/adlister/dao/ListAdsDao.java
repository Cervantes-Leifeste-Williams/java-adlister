package com.codeup.adlister.dao;

import com.codeup.adlister.controllers.Config;
import com.codeup.adlister.models.Ad;

import java.util.ArrayList;
import java.util.List;

public class ListAdsDao implements Ads {
    private List<Ad> ads;

    public ListAdsDao(Config config) {
    }

    public List<Ad> all() {
        if (ads == null) {
            ads = generateAds();
        }
        return ads;
    }

    public Long insert(Ad ad) {
        // make sure we have ads
        if (ads == null) {
            ads = generateAds();
        }
        // we'll assign an "id" here based on the size of the ads list
        // really the dao would handle this
        ad.setId((long) ads.size());
        ads.add(ad);
        return ad.getId();
    }

    private List<Ad> generateAds() {
        List<Ad> ads = new ArrayList<>();
        ads.add(new Ad(
            1,
            1,
            "Batman Funko Pop 283",
            "Dark Knights Metals Red Death"
        ));
        ads.add(new Ad(
            2,
            1,
            "Evangelion Funko Pop 747",
            "Neon Genesis EVA UNIT 01!"
        ));
        ads.add(new Ad(
            3,
            2,
            "FLCL Funko Pop 458",
            "FLCL Canti Anime Robot"
        ));
        ads.add(new Ad(
            4,
            2,
            "Halo Funko Pop 08",
            " Custom Halo SGT. Johnson with an ODST body."
        ));
        return ads;
    }
}
