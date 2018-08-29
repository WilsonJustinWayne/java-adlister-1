package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // search ads
    List<Ad> searchAds(String searchTerm);
    // search for ad by an id
    Ad findById(long id);
    // update an ad
    void updateAd(String title, String description, long id) throws SQLException;
}
