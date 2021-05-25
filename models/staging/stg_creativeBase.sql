SELECT 
CampaignId,
CreativeId, 
AdGroupId, 
Date,
Sum(Clicks) Clicks, 
Sum(Conversions) conversions, 
Sum(CostPerConversion) cost,
FROM {{var('t_adStats')}}
GROUP BY 1,2,3,4