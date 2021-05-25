SELECT
AdGroupId, 
CampaignId, 
Date,
sum(clicks) Clicks, 
sum(cost) AS cost
FROM {{var('t_adGroupStats')}}
GROUP BY 1,2,3