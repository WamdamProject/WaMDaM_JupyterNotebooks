Select ScenarioName,COUNT (DISTINCT (InstanceName)) As '#Reservoirs',sum(NumericValue) As 'TotalCapacity'

/*ObjectTypeCV,ObjectType,AttributeName_Abstract,AttributeDataTypeCV,InstanceName,
UnitName,MethodName,SourceName,
--As Existing_UnitName,
NumericValue
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


AttributeDataTypeCV IN ('NumericValues' ) and NumericValue is not null

AND NumericValue !='0'

AND AttributeName_Abstract='Storage Capacity' and ObjectType='Reservoir'

AND ScenarioName='Bear River WEAP Model 2017' and InstanceName != 'Bear Lake'



Group by ScenarioName

--Order by AverageAnnualDemand

UNION 
-------------------------------------------------------------------------------------------

Select ScenarioName,COUNT (DISTINCT (InstanceName)) As '#Reservoirs',sum(NumericValue) As 'TotalCapacity'

/*ObjectTypeCV,ObjectType,AttributeName_Abstract,AttributeDataTypeCV,InstanceName,
UnitName,MethodName,SourceName,
--As Existing_UnitName,
NumericValue
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


AttributeDataTypeCV IN ('NumericValues' ) and NumericValue is not null

AND NumericValue !='0'

AND AttributeName_Abstract='Storage Capacity' and ObjectType='Reservoir'

AND ScenarioName='Bear River WEAP Model 2017' and InstanceName = 'Bear Lake'

-------------------------------------------------------------------------------------------

UNION

Select DISTINCT ScenarioName,COUNT ( DISTINCT InstanceName) As '#Reservoirs',sum(DISTINCT NumericValue)*1000 As 'TotalCapacity'

/*ObjectTypeCV,ObjectType,AttributeName_Abstract,AttributeDataTypeCV,InstanceName,
UnitName,MethodName,SourceName,
--As Existing_UnitName,
NumericValue
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


AttributeDataTypeCV IN ('NumericValues' ) and NumericValue is not null

AND NumericValue !='0'

AND AttributeName_Abstract='Storage Capacity' and ObjectType='Reservoir'


AND ScenarioName='Base' AND InstanceName != 'Great Salt Lake'

Group by ScenarioName

--Order by AverageAnnualDemand
