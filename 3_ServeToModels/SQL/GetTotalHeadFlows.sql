SELECT ResourceTypeAcronym,ScenarioName,Count (DISTINCT InstanceName) As '#Instance' ,AttributeDataTypeCV,AttributeName_Abstract,Sum(DataValue)*60.37/684*12 as 'AnnualDischarge'
--multiplier: convert cfs/month to acre-feet/month then divide the sum over 684 months in the simulation period

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

AND AttributeName_Abstract='Headflow'

--AND InstanceName='Wanship to Echo' 

AND ScenarioName='Base' 

--Group by ScenarioName


Union


SELECT ResourceTypeAcronym,ScenarioName,InstanceName,AttributeDataTypeCV,AttributeName_Abstract,Sum(SeasonNumericValue)*60.37 as 'AnnualDischarge'

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


-- Join the ValuesMapper to get their Seasonal 
LEFT JOIN "SeasonalNumericValues"
ON "SeasonalNumericValues"."ValuesMapperID" = "ValuesMapper"."ValuesMapperID"

WHERE 
AttributeDataTypeCV='SeasonalNumericValues' and 'SeasonalNumericValue' is not null



AND AttributeName_Abstract='Headflow'

AND ScenarioName='Base' 



Union 



SELECT ResourceTypeAcronym,ScenarioName,Count (DISTINCT InstanceName) As '#Instance' ,AttributeDataTypeCV,AttributeName_Abstract,Sum(DataValue)*60.37/492*12 as 'AnnualDischarge'
--multiplier: convert cfs/month to acre-feet/month then divide the sum over 492 months in the simulation period
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


AND AttributeName_Abstract='Headflow'


AND ScenarioName='Bear River WEAP Model 2017' 

--Group by ScenarioName

UNION


SELECT ResourceTypeAcronym,ScenarioName,InstanceName,AttributeDataTypeCV,AttributeName_Abstract,Sum(SeasonNumericValue)*60.37 as 'AnnualDischarge'

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


-- Join the ValuesMapper to get their Seasonal 
LEFT JOIN "SeasonalNumericValues"
ON "SeasonalNumericValues"."ValuesMapperID" = "ValuesMapper"."ValuesMapperID"

WHERE 
AttributeDataTypeCV='SeasonalNumericValues' and 'SeasonalNumericValue' is not null


AND AttributeName_Abstract='Headflow'

AND ScenarioName='Bear River WEAP Model 2017' 
