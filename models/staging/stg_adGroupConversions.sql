SELECT 
AdGroupId, 
externalCustomerId,
Date,
SUM(Conversions) Conversions,
SUM(CASE WHEN ConversionTypeName = {{var('convName1')}} THEN Conversions ELSE 0 END) as conv1,
SUM(CASE WHEN ConversionTypeName = {{var('convName2')}} THEN Conversions ELSE 0 END) as conv2,
SUM(CASE WHEN ConversionTypeName = {{var('convName4')}} THEN Conversions ELSE 0 END) as conv4,
SUM(CASE WHEN ConversionTypeName = {{var('convName3')}} THEN Conversions ELSE 0 END) as conv3,
SUM(CASE WHEN ConversionTypeName = {{var('convName5')}} THEN Conversions ELSE 0 END) as conv5,
SUM(CASE WHEN ConversionTypeName = {{var('convName6')}} THEN Conversions ELSE 0 END) as conv6,
SUM(CASE WHEN ConversionTypeName = {{var('convName7')}} THEN Conversions ELSE 0 END) as conv7,
SUM(CASE WHEN ConversionTypeName = {{var('convName8')}} THEN Conversions ELSE 0 END) as conv8,
SUM(CASE WHEN ConversionTypeName = {{var('convName9')}} THEN Conversions ELSE 0 END) as conv9,
FROM {{var('t_adGroupConv')}}
GROUP BY 1,2,3