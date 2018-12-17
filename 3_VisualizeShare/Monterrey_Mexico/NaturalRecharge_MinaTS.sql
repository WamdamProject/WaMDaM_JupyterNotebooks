SELECT ResourceTypeAcronym,ScenarioName,MasterNetworkName, ObjectType,AttributeName,AttributeName_Abstract,AttributeNameCV,AttributeCategoryName, 
AggregationStatisticCV,IntervalTimeUnitCV,UnitNameCV,UnitName, DateTimeStamp,DataValue

FROM "ResourceTypes"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."ResourceTypeID"="ResourceTypes"."ResourceTypeID"

-- Join the Objects to get their attributes  
LEFT JOIN  "Attributes"
ON "Attributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

LEFT JOIN "AttributeCategories" 
ON "AttributeCategories"."AttributeCategoryID"="Attributes"."AttributeCategoryID"

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

LEFT JOIN "TimeSeries" 
ON "TimeSeries"."ValuesMapperID"="ValuesMapper"."ValuesMapperID"

LEFT JOIN "TimeSeriesValues" 
ON "TimeSeriesValues"."TimeSeriesID"="TimeSeries"."TimeSeriesID"

WHERE
AttributeDataTypeCV='TimeSeries'

AND ResourceTypeAcronym='WaterLP v0.3'

AND AttributeName='Natural Recharge'

AND InstanceName='Mina'


