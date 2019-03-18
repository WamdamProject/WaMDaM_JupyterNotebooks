

SELECT ResourceTypeAcronym,ScenarioName,ObjectType,AttributeName_Abstract,InstanceName

FROM ResourceTypes

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."ResourceTypeID"="ResourceTypes"."ResourceTypeID"

-- Join the Objects to get their attributes  
LEFT JOIN  "Attributes"
ON "Attributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

LEFT JOIN "Mappings"
ON Mappings.AttributeID= Attributes.AttributeID

LEFT JOIN "Instances" 
ON "Instances"."InstanceID"="Mappings"."InstanceID"

LEFT JOIN "ValuesMapper" 
ON "ValuesMapper"."ValuesMapperID"="Mappings"."ValuesMapperID"

LEFT JOIN "ScenarioMappings"
ON "ScenarioMappings"."MappingID"="Mappings"."MappingID"

LEFT JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMappings"."ScenarioID"

LEFT JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"


LEFT JOIN "NumericValues" 
ON "NumericValues"."ValuesMapperID"="ValuesMapper"."ValuesMapperID"


WHERE InstanceName is not null

--exclude the dummy attributes that are just used to connect Object Types with their Instances.
AND AttributeName!='ObjectTypeInstances'

AND (NumericValue is not 0)-- and  NumericValue is not 100)

AND ModelInputOrOutput is not "Output"

and AttributeDataTypeCV is not "AttributeSeries"

-- Provide the model name
AND "ResourceTypeAcronym"='WEAP'

AND ScenarioName='Bear River WEAP Model 2017'

