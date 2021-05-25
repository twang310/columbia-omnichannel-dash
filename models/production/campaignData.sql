SELECT
cm.CampaignName, 
im.impr Impressions,
cb.*,
cc.Conversions,
cc.conv1, 
cc.conv2, 
cc.conv3,
cc.conv4, 
cc.conv5, 
cc.conv6,
cc.conv7, 
cc.conv8, 
cc.conv9,
(sum(cb.clicks) / sum(NULLIF(im.impr,0))) ctr,
(sum(cb.cost) / sum(NULLIF(cb.clicks,0))) cpc,
(sum(cc.Conversions) / sum(NULLIF(cb.clicks,0))) convRate,
(sum(cb.Cost) / sum(NULLIF(cc.Conversions, 0))) costPerConv
FROM {{ref('stg_campaignBase')}} cb
JOIN {{ref('stg_campaignLookup')}} cm
ON cb.campaignId = cm.campaignId
LEFT JOIN {{ref('stg_campaignImpressions')}} im
ON cb.campaignId = im.campaignId 
AND cb.externalCustomerId = im.externalCustomerId
AND cb.Date = im.Date

LEFT JOIN {{ref('stg_campaignConversions')}} cc
ON cb.campaignId = cc.campaignId
AND cb.Date = cc.Date

GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14, 15, 16, 17
