
SELECT
    Date AS date,
    Insertion_Order_ID AS insertion_order_id,
    Insertion_Order AS insertion_order,
    Insertion_Order_Status AS insertion_order_status,
    Advertiser_ID AS advertiser_id,
    Advertiser AS advertiser,
    YouTube_Ad_Group_ID AS trueview_ad_group_id,
    YouTube_Ad AS trueview_ad,
    YouTube_Ad_ID AS trueview_ad_id,
    YouTube_Ad_Group AS trueview_ad_group,
    Advertiser_Currency AS advertiser_currency,
    Revenue__Adv_Currency_ AS media_cost_revenue,
    Media_Cost__USD_ AS mediacost,
    Impressions AS impressions,
    Clicks AS clicks,
    Complete_Views__Video_ AS video_fully_played,
    First_Quartile_Views__Video_ AS video_completions_25%,
    Midpoint_Views__Video_ AS video_completions_50%,
    Third_Quartile_Views__Video_ AS video_completions_75%,
    null AS video_starts

FROM {BASE_DV360_TRUVIEW}