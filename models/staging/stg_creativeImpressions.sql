SELECT
CreativeId, 
externalCustomerId, 
Date,
sum(Impressions) impr
FROM {{var('t_adStats')}}
GROUP BY 1,2,3