/*
2_IdentifyDemandSites_Seasonal_Values.sql
*/

Select ResourceTypeAcronym,ScenarioName,InstanceName,ObjectTypeCV,AttributeName,AttributeScale,AttributeNameCV,UnitName,SeasonName,SeasonNumericValue,SeasonOrder



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


WHERE AttributeName ='dReqBase'
--WHERE AttributeName ='Qmax'


--AND ScenarioName=='Many years'

AND AttributeDataTypeCV='SeasonalNumericValues'

AND InstanceName in ('j3')

Order  BY ScenarioName, InstanceName, SeasonOrder
