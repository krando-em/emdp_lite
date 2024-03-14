/*
 QUERIES TO CREATE SYNTHETIC CROSS-CHANNEL DATA FOR EMDP LITE PROJECT
 DATE: March-14-2024
 */
-- SOCIAL
create table `essence-dstarget-dwh.target_emdp_lite_reporting_models.final_social_delivery_synthetic` as (
    SELECT
        Date as Day,
        Platform_Name as Platform,
        Campaign as Campaign,
        Creative as Creative_Name,
        Placement as Media_Buy_Name,
        Spend,
        Impressions,
        Clicks,
        Video_Start,
        Video_Completion_25_perc,
        Video_Completion_50_perc,
        Video_Completion_75_perc,
        Video_Complete
    FROM
        `essence-ds-purple-dwh.purple_brd_transformation.final_social_delivery`
    where
        platform_name in ("Meta", "Snapchat")
);

-- SEARCH 
create table `essence-dstarget-dwh.target_emdp_lite_reporting_models.final_search_delivery_synthetic` as (
    SELECT
        Date as Day,
        Platform_Name as engine,
        Campaign as Campaign,
        Campaign_ID as Campaign_ID,
        DATE_TRUNC(Date, WEEK) as Week,
        Spend,
        Impressions,
        Clicks,
        SA360_Visits as total_conversions
    FROM
        `essence-ds-purple-dwh.purple_brd_transformation.final_search_delivery` --where platform_name in ("Meta","Snapchat")
);

-- DISPLAY 
create table `essence-dstarget-dwh.target_emdp_lite_reporting_models.final_display_delivery_synthetic` as (
    SELECT
        f.Date as Day,
        DATE_TRUNC(f.Date, WEEK) as Week,
        f.Campaign_Advertiser_ID as Advertiser_ID,
        f.Campaign_Advertiser AS Advertiser,
        f.Campaign_ID,
        f.Campaign,
        f.Placement_ID,
        f.Placement,
        f.Creative_ID,
        f.Creative,
        f.Platform_Name as Site,
        f.impressions,
        f.Clicks,
        f.Video_Start as Video_Started,
        f.Video_Completion_50_perc as Video_Half_Played,
        f.Video_Complete as Vide_Fully_Played,
        f.Spend as Spend
    from
        (
            select
                p.*
            from
                `essence-ds-purple-dwh.purple_brd_transformation.final_display_delivery` p
            WHERE
                PLATFORM_NAME LIKE "%DV360%"
            union
            all
            select
                s.*
            EXCEPT
                (Channel)
            from
                `essence-dstarget-dwh.target_emdp_lite_cross_channel.final_cross_channel_delivery` s
        ) f
);