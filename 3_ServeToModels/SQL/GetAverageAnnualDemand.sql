SELECT ScenarioName,AttributeDataTypeCV,count(Distinct(InstanceName)) As NoumInstances,sum(DataValue)/66 as AverageAnnualDemand


/*AttributeName_Abstract, AggregationStatisticCV,IntervalTimeUnitCV,UnitName,SourceName,
MethodName,PeopleSources.PersonName As SourcePerson,OrganizationsSources.OrganizationName As SoureOrganization,DateTimeStamp,DataValue
*/

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

Left JOIN "Methods" 
ON "Methods"."MethodID"="Mappings"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="Mappings"."SourceID"

Left JOIN "People" As "PeopleSources"
ON "PeopleSources"."PersonID"="Sources"."PersonID"

Left JOIN "People" As "PeopleMethods" 
ON "PeopleMethods"."PersonID"="Methods"."PersonID"

Left JOIN "Organizations" As "OrganizationsMethods" 
ON "OrganizationsMethods" ."OrganizationID"="PeopleMethods"."OrganizationID"

Left JOIN "Organizations" As "OrganizationsSources" 
ON "OrganizationsSources" ."OrganizationID"="PeopleSources"."OrganizationID"

LEFT JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMappings"."ScenarioID"

LEFT JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"

LEFT JOIN "TimeSeries" 
ON "TimeSeries"."ValuesMapperID"="ValuesMapper"."ValuesMapperID"

LEFT JOIN "TimeSeriesValues" 
ON "TimeSeriesValues"."TimeSeriesID"="TimeSeries"."TimeSeriesID"

WHERE 
AttributeDataTypeCV='TimeSeries' and DataValue is not null

AND AttributeName_Abstract='Monthly Demand'

--AND InstanceName='Wanship to Echo' 

AND ScenarioName='Base' 

Group by ScenarioName


Union 

------------------------------------------------------------------------------------------------

Select ScenarioName,AttributeDataTypeCV,count(Distinct(InstanceName)) As NoumInstances,sum(SeasonNumericValue) as AverageAnnualDemand

/*AttributeName_Abstract,AttributeDataTypeCV,InstanceName,SeasonName,UnitName,
SourceName,MethodName,
SeasonNumericValue,SeasonOrder
--,Longitude_x,Latitude_y
*/


FROM ResourceTypes
LEFT JOIN "ObjectTypes" 
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


-- Join the ValuesMapper to get their Seasonal 
LEFT JOIN "SeasonalNumericValues"
ON "SeasonalNumericValues"."ValuesMapperID" = "ValuesMapper"."ValuesMapperID"

-- Join the ValuesMapper to get their Numeric parameters   
LEFT JOIN "NumericValues"
ON "NumericValues"."ValuesMapperID" = "ValuesMapper"."ValuesMapperID"


WHERE  

AttributeDataTypeCV IN ('SeasonalNumericValues','NumericValues' ) and SeasonNumericValue is not null

AND AttributeName_Abstract in ('Monthly Demand' , 'Annual Water Use Rate')

AND ScenarioName='Bear River WEAP Model 2017' 

Group by ScenarioName,AttributeDataTypeCV


Union


------------------------------------------------------------------------------------------------

Select ScenarioName,AttributeDataTypeCV,count(Distinct(InstanceName)) As NoumInstances,sum(NumericValue) as AverageAnnualDemand

/*AttributeName_Abstract,AttributeDataTypeCV,InstanceName,SeasonName,UnitName,
SourceName,MethodName,
SeasonNumericValue,SeasonOrder
--,Longitude_x,Latitude_y
*/


FROM ResourceTypes
LEFT JOIN "ObjectTypes" 
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



-- Join the ValuesMapper to get their Numeric parameters   
LEFT JOIN "NumericValues"
ON "NumericValues"."ValuesMapperID" = "ValuesMapper"."ValuesMapperID"


WHERE  

AttributeDataTypeCV IN ('NumericValues' ) and 'NumericValue' is not null

AND AttributeName_Abstract in ('Annual Water Use Rate')

AND ScenarioName='Bear River WEAP Model 2017' 

Group by ScenarioName,AttributeDataTypeCV


Order by ScenarioName
