/*
2_IdentifyDemandSites_Seasonal_Values.sql
*/

Select DISTINCT ResourceTypeAcronym,ScenarioName,ObjectTypeCV,AttributeName_Abstract,AttributeNameCV,UnitName,
InstanceName,SeasonName,SeasonNumericValue,SeasonOrder


FROM ResourceTypes

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."ResourceTypeID"="ResourceTypes"."ResourceTypeID"

-- Join the Objects to get their attributes  
LEFT JOIN  "Attributes"
ON "Attributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

LEFT JOIN "Mappings"
ON "Mappings"."AttributeID"= "Attributes"."AttributeID"

LEFT JOIN "Instances" 
ON "Instances"."InstanceID"="Mappings"."InstanceID"

LEFT JOIN "InstanceCategories" 
ON "InstanceCategories"."InstanceCategoryID"="Instances"."InstanceCategoryID"

LEFT JOIN "ValuesMapper" 
ON "ValuesMapper"."ValuesMapperID"="Mappings"."ValuesMapperID"

LEFT JOIN "ScenarioMappings"
ON "ScenarioMappings"."MappingID"="Mappings"."MappingID"

LEFT JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMappings"."ScenarioID"

LEFT JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"

LEFT join "Methods"
 ON "Methods"."MethodID" = "Mappings"."MethodID"

LEFT join "Sources" 
ON "Sources"."SourceID" = "Mappings"."SourceID"


-- Join the DataValuesMapper to get their Seasonal 
LEFT JOIN "SeasonalNumericValues"
ON "SeasonalNumericValues"."ValuesMapperID" = "ValuesMapper"."ValuesMapperID" 


WHERE AttributeName_Abstract ='Monthly Demand'


AND ScenarioName in ('Bear River WEAP Model 2017','Cons25PercCacheUrbWaterUse',
'Incr25PercCacheUrbWaterUse')

AND AttributeDataTypeCV IN ('SeasonalNumericValues')

AND InstanceName in ('Logan Potable','North Cache Potable','South Cache Potable')

GROUP  BY ScenarioName, InstanceName,SeasonOrder
