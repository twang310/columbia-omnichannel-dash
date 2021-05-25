SELECT 
campaignId,
externalCustomerId,
Date,
sum(clicks) Clicks, 
sum(cost) AS cost
FROM {{var('t_campaignStats')}}
GROUP BY 1,2,3
