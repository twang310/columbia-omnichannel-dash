SELECT 
s.CampaignId, 
c.CampaignName,
s.CreativeId, 
al.AdGroupName,
u.FinalUrl, 
im.impr Impressions, 
s.Clicks, 
s.Cost, 
s.Conversions, 
s.Date,
(s.Clicks/NULLIF(im.impr, 0)) ctr, 
(s.Conversions/NULLIF(s.Clicks, 0)) ConvRate, 
(s.Cost/NULLIF(s.Clicks,0)) cpc, 
(s.Cost/NULLIF(s.Conversions,0)) CostPerConv
FROM {{ref('stg_creativeBase')}} s
JOIN {{ref('stg_creativeLookup')}} u
ON u.campaignId = s.campaignId AND u.CreativeId = s.CreativeId
LEFT JOIN {{ref('stg_creativeImpressions')}} im
ON s.CreativeId = im.CreativeId 
AND s.Date = im.Date
JOIN {{ref('stg_campaignLookup')}} c
ON c.campaignId = s.campaignId 
LEFT JOIN {{ref('stg_adGroupLookup')}} al
ON s.AdGroupId = al.AdGroupId
GROUP BY 1,2,3,4,5,6,7,8,9,10