package com.codeup.adlister.dao;

import com.codeup.adlister.models.AdCategory;

import java.util.List;

public interface AdsCategories {
    //adding to the Ad-Cat table
    void insert(long adId, long catId);
    List<AdCategory> findByAdId(long adId);
}
