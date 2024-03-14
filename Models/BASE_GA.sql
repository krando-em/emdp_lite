SELECT
    Day AS date,
    Device AS device,
    Campaign_id AS campaignid,
    Campaign AS campaign,
    "" AS advertiserid,
    "" AS advertiser,
    Ad_group_id AS adgroupid,
    Ad_group AS adgroup,
    Currency AS currency,
    Network AS network,
    Impressions AS impressions,
    Clicks AS click,
    Cost AS media_cost,
    Interactions AS interactions,
    Conversions AS conversions

FROM {BASE_GA_TABLE}