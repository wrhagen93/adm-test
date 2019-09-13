-- Views112335672

CREATE OR REPLACE VIEW OM_CMN_ApplicationLocation_View  AS  select `AP`.`id` AS `id`,`AP`.`omId` AS `omId`,`AP`.`correlationId` AS `correlationId`,`AP`.`correlationName` AS `correlationName`,`AP`.`statusId` AS `statusId`,`AP`.`applicationDate` AS `applicationDate`,`AP`.`expectedCompletionDate` AS `expectedCompletionDate`,`AP`.`deleteFlag` AS `deleteFlag`,`LOC`.`id` AS `locationId`,`LOC`.`locId` AS `locId`,`APItem`.`id` AS `ApitemID`,`APItem`.`itemSubTypeRefId` AS `product`,`ItemSubType`.`name` AS `productName` from (((`OM_CMN_Application` `AP` left join `OM_CMN_Location` `LOC` on((`AP`.`locationId` = `LOC`.`id`))) join `OM_CMN_ApplicationItem` `APItem` on((`APItem`.`applicationId` = `AP`.`id`))) join `OM_CMN_R_ItemSubTypeRef` `ItemSubType` on((`ItemSubType`.`id` = `APItem`.`itemSubTypeRefId`))) ;

CREATE OR REPLACE VIEW OM_CMN_ApplicationSFCFibreJointLocation_View  AS  select `AP`.`id` AS `id`,`AP`.`omId` AS `omId`,`AP`.`correlationId` AS `correlationId`,`AP`.`correlationName` AS `correlationName`,`AP`.`statusId` AS `statusId`,`AP`.`applicationDate` AS `applicationDate`,`AP`.`expectedCompletionDate` AS `expectedCompletionDate`,`AP`.`applicationOwner` AS `applicationOwner`,`AP`.`deleteFlag` AS `deleteFlag`,`SFC`.`salesforceQuoteName` AS `salesforceQuoteName`,`SFC`.`salesforceQuoteId` AS `salesforceQuoteId`,`SFC`.`salesforceParentOppName` AS `salesforceParentOppName`,`SFC`.`salesforceParentOppId` AS `salesforceParentOppId`,`SFC`.`fibreBuildCategory` AS `fibreBuildCategory`,`SFC`.`cost` AS `cost`,`LOC`.`addressFullText` AS `address`,`SFC`.`bsmApprovalRequired` AS `bsmApprovalRequired`,`SFC`.`bsmDecision` AS `bsmDecision`,`SFC`.`estimatedBuildTimeframe` AS `estimatedBuildTimeframe`,`FB`.`fibreJointId` AS `fibreJointId`,`FB`.`fibreJointStatus` AS `fibreJointStatus`,`FB`.`fibreJointTypeCode` AS `fibreJointTypeCode`,`FB`.`fibreJointTypeDescription` AS `fibreJointTypeDescription`,`FB`.`fibreJointLatLong` AS `fibreJointLatLong`,`FB`.`loSDistance` AS `loSDistance`,`FB`.`revisedDistance` AS `revisedDistance`,`FB`.`derivedDistance` AS `derivedDistance`,`LOC`.`locId` AS `locId`,`LOC`.`locationType` AS `locationType`,`LOC`.`longitude` AS `longitude`,`LOC`.`latitude` AS `latitude`,`LOC`.`csaId` AS `csaId`,`LOC`.`samId` AS `samId`,`LOC`.`accessTechnologyType` AS `accessTechnologyType`,`LOC`.`primaryTechnology` AS `primaryTechnology`,`LOC`.`serviceRegion` AS `serviceRegion`,`LOC`.`serviceType` AS `serviceType`,`API`.`itemSubTypeRefId` AS `productRefId` from ((((`OM_CMN_Application` `AP` left join `OM_CMN_ApplicationItem` `API` on((`AP`.`id` = `API`.`applicationId`))) left join `OM_CMN_Location` `LOC` on((`AP`.`locationId` = `LOC`.`id`))) left join `OM_CMN_FibreJoint` `FB` on((`API`.`id` = `FB`.`itemId`))) left join `OM_CMN_APP_ServiceFeasibilityCosting` `SFC` on((`API`.`id` = `SFC`.`applicationItemId`))) ;

CREATE OR REPLACE VIEW OM_CMN_APP_ServiceFeasibilityCosting_View  AS  select `OM_CMN_APP_ServiceFeasibilityCosting`.`id` AS `id`,`OM_CMN_APP_ServiceFeasibilityCosting`.`applicationItemId` AS `applicationItemId`,`OM_CMN_APP_ServiceFeasibilityCosting`.`statusId` AS `statusId`,`OM_CMN_APP_ServiceFeasibilityCosting`.`salesforceOppId` AS `salesforceOppId`,`OM_CMN_APP_ServiceFeasibilityCosting`.`salesforceQuoteName` AS `salesforceQuoteName`,`OM_CMN_APP_ServiceFeasibilityCosting`.`salesforceQuoteId` AS `salesforceQuoteId`,`OM_CMN_APP_ServiceFeasibilityCosting`.`salesforceParentOppId` AS `salesforceParentOppId`,`OM_CMN_APP_ServiceFeasibilityCosting`.`salesforceOppName` AS `salesforceOppName`,`OM_CMN_APP_ServiceFeasibilityCosting`.`salesforceParentOppName` AS `salesforceParentOppName`,`OM_CMN_APP_ServiceFeasibilityCosting`.`ragValue` AS `ragValue`,`OM_CMN_APP_ServiceFeasibilityCosting`.`fibreBuildCategory` AS `fibreBuildCategory`,`OM_CMN_FUNC_CeilDecimalToInt`(`OM_CMN_APP_ServiceFeasibilityCosting`.`cost`) AS `cost`,`OM_CMN_APP_ServiceFeasibilityCosting`.`address` AS `address`,`OM_CMN_APP_ServiceFeasibilityCosting`.`bsmApprovalRequired` AS `bsmApprovalRequired`,`OM_CMN_APP_ServiceFeasibilityCosting`.`bsmDecision` AS `bsmDecision`,`OM_CMN_APP_ServiceFeasibilityCosting`.`estimatedBuildTimeframe` AS `estimatedBuildTimeframe`,`OM_CMN_APP_ServiceFeasibilityCosting`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_APP_ServiceFeasibilityCosting`.`updatedOnDTime` AS `updatedOnDTime` from `OM_CMN_APP_ServiceFeasibilityCosting` ;

CREATE OR REPLACE VIEW OM_CMN_Audit_View  AS  select `OM_CMN_Audit`.`id` AS `id`,`OM_CMN_Audit`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_Audit`.`recordId` AS `recordId`,`OM_CMN_Audit`.`actionName` AS `actionName`,`OM_CMN_Audit`.`buttonAction` AS `buttonAction`,`OM_CMN_Audit`.`description` AS `description`,`OM_CMN_Audit`.`createdBy` AS `createdBy`,`OM_CMN_Audit`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_Audit`.`auditTypeRefId` AS `auditTypeRefId`,`OM_CMN_Audit`.`assigneeUserOrGroupId` AS `assigneeUserOrGroupId`,`OM_CMN_Audit`.`taskDeadlineDTime` AS `taskDeadlineDTime`,`OM_CMN_Audit`.`taskStartDTime` AS `taskStartDTime`,`OM_CMN_Audit`.`updatedOnDTime` AS `updatedOnDTime` from `OM_CMN_Audit` ;

CREATE OR REPLACE VIEW OM_CMN_BTDItem_View  AS  select `BTD`.`id` AS `btdId`,`BTD`.`btdType` AS `btdType`,`BTD`.`btdMounting` AS `btdMounting`,`BTD`.`powerSupply1` AS `powerSupply1`,`BTD`.`powerSupply2` AS `powerSupply2`,`BTD`.`physicalName` AS `physicalName`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId`,`BTD`.`iesPhysicalInterfaceIpSubnet` AS `iesPhysicalInterfaceIpSubnet`,`BTD`.`networkPort` AS `networkPort`,`BTD`.`sfpType` AS `sfpType` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 2)))) join `OM_CMN_BTD` `BTD` on((`BTD`.`id` = `OI`.`entityId`))) ;

CREATE OR REPLACE VIEW OM_CMN_BTD_View  AS  select `OM_CMN_BTD`.`id` AS `id`,`OM_CMN_BTD`.`itemId` AS `itemId`,`OM_CMN_BTD`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_BTD`.`btdType` AS `btdType`,`OM_CMN_BTD`.`btdMounting` AS `btdMounting`,`OM_CMN_BTD`.`powerSupply1` AS `powerSupply1`,`OM_CMN_BTD`.`powerSupply2` AS `powerSupply2`,`OM_CMN_BTD`.`physicalName` AS `physicalName`,`OM_CMN_BTD`.`createdBy` AS `createdBy`,`OM_CMN_BTD`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_BTD`.`updatedBy` AS `updatedBy`,`OM_CMN_BTD`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_BTD`.`orderId` AS `orderId`,`OM_CMN_BTD`.`iesPhysicalInterfaceIpSubnet` AS `iesPhysicalInterfaceIpSubnet`,`OM_CMN_BTD`.`networkPort` AS `networkPort`,`OM_CMN_BTD`.`sfpType` AS `sfpType`,`OM_CMN_BTD`.`itemSubTypeRefId` AS `itemSubTypeRefId` from `OM_CMN_BTD` ;

CREATE OR REPLACE VIEW OM_CMN_CNCItem_View  AS  select `CNC`.`id` AS `cncId`,`CNC`.`nni` AS `nni`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 5)))) join `OM_CMN_CNC` `CNC` on((`CNC`.`id` = `OI`.`entityId`))) ;

CREATE OR REPLACE VIEW OM_CMN_CNCTunnelView  AS  select `tunnel`.`id` AS `tunnelId`,`item`.`orderId` AS `orderId`,`item`.`omId` AS `cncName`,`site`.`hostName` AS `fromHostname`,`tunnel`.`toHostName` AS `toHostname`,`tunnel`.`pathId` AS `pathId` from ((((`OM_CMN_OrderItem` `item` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`item`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 5)))) join `OM_CMN_CNC` `cnc` on((`cnc`.`id` = `item`.`entityId`))) left join `OM_CMN_Site` `site` on((`cnc`.`id` = `site`.`cncId`))) left join `OM_CMN_Tunnel` `tunnel` on((`site`.`id` = `tunnel`.`siteId`))) ;

CREATE OR REPLACE VIEW OM_CMN_CNC_View  AS  select `OM_CMN_CNC`.`id` AS `id`,`OM_CMN_CNC`.`itemId` AS `itemId`,`OM_CMN_CNC`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_CNC`.`nni` AS `nni`,`OM_CMN_CNC`.`createdBy` AS `createdBy`,`OM_CMN_CNC`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_CNC`.`updatedBy` AS `updatedBy`,`OM_CMN_CNC`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_CNC`.`itemSubTypeRefId` AS `itemSubTypeRefId` from `OM_CMN_CNC` ;

CREATE OR REPLACE VIEW OM_CMN_EnterpriseEthernet_View  AS  select `OM_CMN_EnterpriseEthernet`.`id` AS `id`,`OM_CMN_EnterpriseEthernet`.`itemId` AS `itemId`,`OM_CMN_EnterpriseEthernet`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_EnterpriseEthernet`.`billingAccountId` AS `billingAccountId`,`OM_CMN_EnterpriseEthernet`.`afterHoursAppointment` AS `afterHoursAppointment`,`OM_CMN_EnterpriseEthernet`.`inductionRequired` AS `inductionRequired`,`OM_CMN_EnterpriseEthernet`.`securityClearance` AS `securityClearance`,`OM_CMN_EnterpriseEthernet`.`notes` AS `notes`,`OM_CMN_EnterpriseEthernet`.`tradingName` AS `tradingName`,`OM_CMN_EnterpriseEthernet`.`heritageSite` AS `heritageSite`,`OM_CMN_EnterpriseEthernet`.`term` AS `term`,`OM_CMN_EnterpriseEthernet`.`serviceRestorationSLA` AS `serviceRestorationSLA`,`OM_CMN_EnterpriseEthernet`.`accessAvailabilityTarget` AS `accessAvailabilityTarget`,`OM_CMN_EnterpriseEthernet`.`zone` AS `zone`,`OM_CMN_EnterpriseEthernet`.`productType` AS `productType`,`OM_CMN_EnterpriseEthernet`.`templateId` AS `templateId`,`OM_CMN_EnterpriseEthernet`.`templateVersion` AS `templateVersion`,`OM_CMN_EnterpriseEthernet`.`npdRequiredFlag` AS `npdRequiredFlag`,`OM_CMN_EnterpriseEthernet`.`orderAcceptedFlag` AS `orderAcceptedFlag`,`OM_CMN_EnterpriseEthernet`.`designAssignCompletedFlag` AS `designAssignCompletedFlag`,`OM_CMN_EnterpriseEthernet`.`csaId` AS `csaId`,`OM_CMN_EnterpriseEthernet`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_EnterpriseEthernet`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_EnterpriseEthernet`.`orderId` AS `orderId`,`OM_CMN_EnterpriseEthernet`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OM_CMN_EnterpriseEthernet`.`informPlanDesignFlag` AS `informPlanDesignFlag`,`OM_CMN_EnterpriseEthernet`.`informDPCommercialFlag` AS `informDPCommercialFlag` from `OM_CMN_EnterpriseEthernet` ;

CREATE OR REPLACE VIEW OM_CMN_FibreItem_View  AS  select `Fibre`.`id` AS `fibreId`,`Fibre`.`dssCableFlag` AS `dssCableFlag`,`Fibre`.`dssCableSize` AS `dssCableSize`,`Fibre`.`noOfTransitionPoints` AS `noOfTransitionPoints`,`Fibre`.`transitionType` AS `transitionType`,`Fibre`.`dependentProject` AS `dependentProject`,`Fibre`.`totalRouteDistance` AS `totalRouteDistance`,`Fibre`.`totalHaulingDistance` AS `totalHaulingDistance`,`Fibre`.`totalDistanceCivilWorks` AS `totalDistanceCivilWorks`,`Fibre`.`fanToCustomerNtdDistance` AS `fanToCustomerNtdDistance`,`Fibre`.`dssLeadInCableToFan` AS `dssLeadInCableToFan`,`Fibre`.`ductReservationRequiredFlag` AS `ductReservationRequiredFlag`,`Fibre`.`estimatedPassiveCosts` AS `estimatedPassiveCosts`,`Fibre`.`fanCode` AS `fanCode`,`Fibre`.`aasAvailabilityFlag` AS `aasAvailabilityFlag`,`Fibre`.`existingAasSupportServiceFlag` AS `existingAasSupportServiceFlag`,`Fibre`.`aasPortAvailabilityFlag` AS `aasPortAvailabilityFlag`,`Fibre`.`transitWorkInvolvedFlag` AS `transitWorkInvolvedFlag`,`Fibre`.`aasServiceStatus` AS `aasServiceStatus`,`Fibre`.`aasPhysicalName` AS `aasPhysicalName`,`Fibre`.`aasPhysicalLocation` AS `aasPhysicalLocation`,`Fibre`.`portReservationDetails` AS `portReservationDetails`,`Fibre`.`reservePortSfpType` AS `reservePortSfpType`,`Fibre`.`labelOnPortForId` AS `labelOnPortForId`,`Fibre`.`oltEasBackhaulUpgradeRequiredFlag` AS `oltEasBackhaulUpgradeRequiredFlag`,`Fibre`.`oltAndPortAvailableFlag` AS `oltAndPortAvailableFlag`,`Fibre`.`tsaDesignRefId` AS `tsaDesignRefId`,`Fibre`.`tsaBuildRefId` AS `tsaBuildRefId`,`Fibre`.`estimatedTransitCost` AS `estimatedTransitCost`,`Fibre`.`estimatedTransitCompletionDate` AS `estimatedTransitCompletionDate`,`Fibre`.`newOdfRackRequiredFlag` AS `newOdfRackRequiredFlag`,`Fibre`.`newOdfPanelLocations` AS `newOdfPanelLocations`,`Fibre`.`insituOdfPanels` AS `insituOdfPanels`,`Fibre`.`validateReserveActiveNetworkComments` AS `validateReserveActiveNetworkComments`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId`,`Fibre`.`fibreBearer` AS `fibreBearer`,`Fibre`.`circuitBearerId` AS `circuitBearerId`,`Fibre`.`aasLogicalName` AS `aasLogicalName`,`Fibre`.`aasPort` AS `aasPort`,`Fibre`.`aasSfpType` AS `aasSfpType`,`Fibre`.`aasPathDesignComplete` AS `aasPathDesignComplete`,`Fibre`.`itemSubTypeRefId` AS `itemSubTypeRefId` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_Fibre` `Fibre` on((`Fibre`.`id` = `OI`.`entityId`))) join `OM_CMN_R_ItemSubTypeRef` `sub` on(((`sub`.`id` = `OI`.`itemSubTypeRefId`) and (`sub`.`id` = 7)))) ;

CREATE OR REPLACE VIEW OM_CMN_FibreJoint_View  AS  select `OM_CMN_FibreJoint`.`id` AS `id`,`OM_CMN_FibreJoint`.`itemId` AS `itemId`,`OM_CMN_FibreJoint`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_FibreJoint`.`fibreJointId` AS `fibreJointId`,`OM_CMN_FibreJoint`.`fibreJointStatus` AS `fibreJointStatus`,`OM_CMN_FibreJoint`.`fibreJointTypeCode` AS `fibreJointTypeCode`,`OM_CMN_FibreJoint`.`fibreJointTypeDescription` AS `fibreJointTypeDescription`,`OM_CMN_FibreJoint`.`fibreJointLatLong` AS `fibreJointLatLong`,`OM_CMN_FUNC_CeilDecimalToInt`(`OM_CMN_FibreJoint`.`loSDistance`) AS `loSDistance`,`OM_CMN_FUNC_CeilDecimalToInt`(`OM_CMN_FibreJoint`.`revisedDistance`) AS `revisedDistance`,`OM_CMN_FUNC_CeilDecimalToInt`(`OM_CMN_FibreJoint`.`derivedDistance`) AS `derivedDistance`,`OM_CMN_FibreJoint`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_FibreJoint`.`updatedOnDTime` AS `updatedOnDTime` from `OM_CMN_FibreJoint` ;

CREATE OR REPLACE VIEW OM_CMN_Fibre_View  AS  select `OM_CMN_Fibre`.`id` AS `id`,`OM_CMN_Fibre`.`itemId` AS `itemId`,`OM_CMN_Fibre`.`dssCableFlag` AS `dssCableFlag`,`OM_CMN_Fibre`.`dssCableSize` AS `dssCableSize`,`OM_CMN_Fibre`.`noOfTransitionPoints` AS `noOfTransitionPoints`,`OM_CMN_Fibre`.`transitionType` AS `transitionType`,`OM_CMN_Fibre`.`totalRouteDistance` AS `totalRouteDistance`,`OM_CMN_Fibre`.`totalHaulingDistance` AS `totalHaulingDistance`,`OM_CMN_Fibre`.`totalDistanceCivilWorks` AS `totalDistanceCivilWorks`,`OM_CMN_Fibre`.`fanToCustomerNtdDistance` AS `fanToCustomerNtdDistance`,`OM_CMN_Fibre`.`dssLeadInCableToFan` AS `dssLeadInCableToFan`,`OM_CMN_Fibre`.`ductReservationRequiredFlag` AS `ductReservationRequiredFlag`,`OM_CMN_Fibre`.`estimatedPassiveCosts` AS `estimatedPassiveCosts`,`OM_CMN_Fibre`.`fanCode` AS `fanCode`,`OM_CMN_Fibre`.`aasAvailabilityFlag` AS `aasAvailabilityFlag`,`OM_CMN_Fibre`.`existingAasSupportServiceFlag` AS `existingAasSupportServiceFlag`,`OM_CMN_Fibre`.`aasPortAvailabilityFlag` AS `aasPortAvailabilityFlag`,`OM_CMN_Fibre`.`transitWorkInvolvedFlag` AS `transitWorkInvolvedFlag`,`OM_CMN_Fibre`.`aasServiceStatus` AS `aasServiceStatus`,`OM_CMN_Fibre`.`aasPhysicalName` AS `aasPhysicalName`,`OM_CMN_Fibre`.`aasPhysicalLocation` AS `aasPhysicalLocation`,`OM_CMN_Fibre`.`portReservationDetails` AS `portReservationDetails`,`OM_CMN_Fibre`.`reservePortSfpType` AS `reservePortSfpType`,`OM_CMN_Fibre`.`labelOnPortForId` AS `labelOnPortForId`,`OM_CMN_Fibre`.`oltEasBackhaulUpgradeRequiredFlag` AS `oltEasBackhaulUpgradeRequiredFlag`,`OM_CMN_Fibre`.`oltAndPortAvailableFlag` AS `oltAndPortAvailableFlag`,`OM_CMN_Fibre`.`tsaDesignRefId` AS `tsaDesignRefId`,`OM_CMN_Fibre`.`tsaBuildRefId` AS `tsaBuildRefId`,`OM_CMN_Fibre`.`estimatedTransitCost` AS `estimatedTransitCost`,`OM_CMN_Fibre`.`estimatedTransitCompletionDate` AS `estimatedTransitCompletionDate`,`OM_CMN_Fibre`.`newOdfRackRequiredFlag` AS `newOdfRackRequiredFlag`,`OM_CMN_Fibre`.`newOdfPanelLocations` AS `newOdfPanelLocations`,`OM_CMN_Fibre`.`insituOdfPanels` AS `insituOdfPanels`,`OM_CMN_Fibre`.`validateReserveActiveNetworkComments` AS `validateReserveActiveNetworkComments`,`OM_CMN_Fibre`.`dependentProject` AS `dependentProject`,`OM_CMN_Fibre`.`fibreBearer` AS `fibreBearer`,`OM_CMN_Fibre`.`circuitBearerId` AS `circuitBearerId`,`OM_CMN_Fibre`.`aasLogicalName` AS `aasLogicalName`,`OM_CMN_Fibre`.`aasPort` AS `aasPort`,`OM_CMN_Fibre`.`aasSfpType` AS `aasSfpType`,`OM_CMN_Fibre`.`aasPathDesignComplete` AS `aasPathDesignComplete`,`OM_CMN_Fibre`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OM_CMN_Fibre`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_Fibre`.`updatedOnDTime` AS `updatedOnDTime` from `OM_CMN_Fibre` ;

CREATE OR REPLACE VIEW OM_CMN_GetLatestStatusVersionId_View  AS  select `o`.`id` AS `orderId`,`OM_CMN_FUNC_GetLatestStatusVersionId`(`o`.`itemSubTypeRefId`,`o`.`orderType`,`o`.`orderTypeRefId`,`o`.`shortfallType`) AS `statusVersionId` from `OM_CMN_Order` `o` ;

CREATE OR REPLACE VIEW OM_CMN_LinkedOrder_View  AS  select uuid() AS `uuid`,`ORD`.`id` AS `id`,`childOrder`.`id` AS `linkedOrderId`,`childOrder`.`omId` AS `omid`,`childOrder`.`correlationName` AS `correlationName`,`childOrder`.`statusId` AS `statusId`,`childOrder`.`name` AS `name`,`childOrder`.`orderDate` AS `orderDate`,`childOrder`.`expectedCompletionDate` AS `expectedCompletionDate`,`childOrder`.`priId` AS `priId` from (`OM_CMN_Order` `ORD` join `OM_CMN_Order` `childOrder` on((`ORD`.`id` = `childOrder`.`parentOrderId`))) union all select uuid() AS `uuid`,`ORD`.`id` AS `id`,`ORD`.`parentOrderId` AS `linkedOrderId`,`parentOrder`.`omId` AS `omid`,`parentOrder`.`correlationName` AS `correlationName`,`parentOrder`.`statusId` AS `statusId`,`parentOrder`.`name` AS `name`,`parentOrder`.`orderDate` AS `orderDate`,`parentOrder`.`expectedCompletionDate` AS `expectedCompletionDate`,`parentOrder`.`priId` AS `priId` from (`OM_CMN_Order` `ORD` join `OM_CMN_Order` `parentOrder` on((`ORD`.`parentOrderId` = `parentOrder`.`id`))) ;

CREATE OR REPLACE VIEW OM_CMN_NbnSelect_SFCApplication_View  AS  (select `AP`.`id` AS `id`,`AP`.`omId` AS `omId`,`AP`.`correlationId` AS `correlationId`,`AP`.`correlationName` AS `correlationName`,(case when (`AP`.`statusId` = '1') then 'PENDING' when (`AP`.`statusId` = '2') then 'IN PROGRESS' when (`AP`.`statusId` = '3') then 'TO-BE ASSIGNED' when (`AP`.`statusId` = '4') then 'COMPLETE' when (`AP`.`statusId` = '5') then 'EXPIRED' else 'INVALID' end) AS `status`,`AP`.`applicationDate` AS `applicationDate`,`AP`.`expectedCompletionDate` AS `expectedCompletionDate`,`AP`.`applicationOwner` AS `applicationOwner`,`SFC`.`salesforceQuoteName` AS `salesforceQuoteName`,`SFC`.`salesforceQuoteId` AS `salesforceQuoteId`,`SFC`.`salesforceParentOppName` AS `salesforceParentOppName`,`SFC`.`salesforceParentOppId` AS `salesforceParentOppId`,(case when (`SFC`.`fibreBuildCategory` = 'A') then 'AUTO' else 'MANUAL' end) AS `fibreBuildCategory`,`SFC`.`cost` AS `cost`,`SFC`.`address` AS `address`,`FB`.`fibreJointId` AS `fibreJointId`,`FB`.`fibreJointStatus` AS `fibreJointStatus`,`FB`.`fibreJointTypeCode` AS `fibreJointTypeCode`,`FB`.`fibreJointTypeDescription` AS `fibreJointTypeDescription`,`FB`.`fibreJointLatLong` AS `fibreJointLatLong`,`FB`.`loSDistance` AS `loSDistance`,`FB`.`revisedDistance` AS `revisedDistance`,`FB`.`derivedDistance` AS `derivedDistance`,`LOC`.`locId` AS `locId`,`LOC`.`locationType` AS `locationType`,`LOC`.`longitude` AS `longitude`,`LOC`.`latitude` AS `latitude`,`LOC`.`csaId` AS `csaId`,`LOC`.`samId` AS `samId`,`LOC`.`accessTechnologyType` AS `accessTechnologyType`,`LOC`.`primaryTechnology` AS `primaryTechnology`,`LOC`.`serviceRegion` AS `serviceRegion`,`LOC`.`serviceType` AS `serviceType` from ((((`OM_CMN_Application` `AP` left join `OM_CMN_ApplicationItem` `API` on((`AP`.`id` = `API`.`applicationId`))) left join `OM_CMN_Location` `LOC` on((`AP`.`locationId` = `LOC`.`id`))) left join `OM_CMN_FibreJoint` `FB` on((`API`.`id` = `FB`.`itemId`))) left join `OM_CMN_APP_ServiceFeasibilityCosting` `SFC` on((`API`.`id` = `SFC`.`applicationItemId`))) where ((`API`.`itemSubTypeRefId` = 6) and (`AP`.`omId` is not null) and (`AP`.`omId` <> ''))) ;

CREATE OR REPLACE VIEW OM_CMN_NetworkBuildStatusReport_View  AS  select `ORD`.`id` AS `id`,`deal`.`dealName` AS `dealName`,`ORD`.`omId` AS `RORId`,`deal`.`RSP` AS `RSP`,if((`ORD`.`itemSubTypeRefId` = 6),`NS`.`tradingName`,`EE`.`tradingName`) AS `tradingName`,if((`ORD`.`itemSubTypeRefId` = 6),`NSPlanDesign`.`deliveryPartner`,`npdPlan`.`deliveryPartner`) AS `deliveryPartner`,`ORD`.`nbnURN` AS `NBNURN`,`ORD`.`USRN` AS `NBNUSRN`,`ORD`.`CRMCaseNumber` AS `CRMCaseNumber`,`LOC`.`locId` AS `locationId`,if((`ORD`.`itemSubTypeRefId` = 6),`NS`.`siteName`,NULL) AS `siteName`,`ORD`.`originalSuppliedAddress` AS `originalSuppliedAddress`,`ORD`.`tranche` AS `tranche`,`ORD`.`sitePriority` AS `sitePriority`,if((`ORD`.`itemSubTypeRefId` = 6),`NSPlanDesign`.`tShirtClassificationFeasibility`,NULL) AS `tShirtClassificationFeasibility`,if((`ORD`.`itemSubTypeRefId` = 6),`NSPlanDesign`.`buildCategory`,`npdPlan`.`orderCategory`) AS `category`,`ORD`.`requestedCompletionDate` AS `customerRequiredDate`,`NSPlanDesign`.`plannedPlanCommenceDate` AS `plannedPlanCommenceDate`,if((`ORD`.`itemSubTypeRefId` = 6),`NSPlanDesign`.`plannedPlanCompletionDate`,`npdDesign`.`expectedCompletionDate`) AS `plannedPlanCompletionDate`,`OCAU`.`taskStartDTime` AS `actualPlanningCommenceDate`,`OCAU`.`updatedOnDTime` AS `actualPlanningCompleteDate`,`ORD`.`expectedCompletionDate` AS `BCD`,`ORD`.`readyToConnectDate` AS `targetCompletionDate`,`npdStatus`.`name` AS `activePhase`,`npdSubStatus`.`name` AS `activeTask` from (((((((((((((((`OM_CMN_Order` `ORD` left join `OM_CMN_Location` `LOC` on((`LOC`.`id` = `ORD`.`locationId`))) left join `OM_CMN_OrderItem` `npdPlanOI` on(((`ORD`.`id` = `npdPlanOI`.`orderId`) and (`npdPlanOI`.`itemSubTypeRefId` = 8)))) left join `OM_CMN_NPDPlan` `npdPlan` on((`npdPlanOI`.`entityId` = `npdPlan`.`id`))) left join `OM_CMN_OrderItem` `npdDesignOI` on(((`ORD`.`id` = `npdDesignOI`.`orderId`) and (`npdDesignOI`.`itemSubTypeRefId` = 10)))) left join `OM_CMN_NPDDesign` `npdDesign` on((`npdDesignOI`.`entityId` = `npdDesign`.`id`))) left join `OM_CMN_OrderItem` `EEOI` on(((`ORD`.`id` = `EEOI`.`orderId`) and (`EEOI`.`itemSubTypeRefId` = 1)))) left join `OM_CMN_EnterpriseEthernet` `EE` on((`EEOI`.`entityId` = `EE`.`id`))) left join `OM_CMN_OrderItem` `NSOI` on(((`ORD`.`id` = `NSOI`.`orderId`) and (`NSOI`.`itemSubTypeRefId` = 6)))) left join `OM_CMN_NBNSelect` `NS` on((`NSOI`.`entityId` = `NS`.`id`))) left join `OM_CMN_OrderItem` `NSPlanDesignOI` on(((`ORD`.`id` = `NSPlanDesignOI`.`orderId`) and (`NSPlanDesignOI`.`itemSubTypeRefId` = 12)))) left join `OM_CMN_NS_NPDPlanDesign` `NSPlanDesign` on((`NSPlanDesignOI`.`entityId` = `NSPlanDesign`.`id`))) left join `OM_CMN_Deal` `deal` on((`ORD`.`dealId` = `deal`.`id`))) left join `OM_CMN_R_StatusRef` `npdStatus` on((`npdStatus`.`id` = `ORD`.`npdStatusId`))) left join `OM_CMN_R_SubstatusRef` `npdSubStatus` on((`npdSubStatus`.`id` = `ORD`.`npdSubstatusId`))) left join `OM_CMN_Audit` `OCAU` on(((`ORD`.`id` = `OCAU`.`recordId`) and (`OCAU`.`recordTypeRefId` = 2) and (`OCAU`.`actionName` = 'Accept Order') and (`OCAU`.`auditTypeRefId` = 1)))) where (`ORD`.`orderTypeRefId` = 2) ;

CREATE OR REPLACE VIEW OM_CMN_NPDDesign_View  AS  select `OM_CMN_NPDDesign`.`id` AS `id`,`OM_CMN_NPDDesign`.`itemId` AS `itemId`,`OM_CMN_NPDDesign`.`ffsMandRequiredFlag` AS `ffsMandRequiredFlag`,`OM_CMN_NPDDesign`.`ffsNonMandRequiredFlag` AS `ffsNonMandRequiredFlag`,`OM_CMN_NPDDesign`.`ffsMandatoryCost` AS `ffsMandatoryCost`,`OM_CMN_NPDDesign`.`ffsNonMandatoryCost` AS `ffsNonMandatoryCost`,`OM_CMN_NPDDesign`.`isTLSRespReceived` AS `isTLSRespReceived`,`OM_CMN_NPDDesign`.`isBTDDesignComplete` AS `isBTDDesignComplete`,`OM_CMN_NPDDesign`.`submittedToTelstraFlag_10_1_2` AS `submittedToTelstraFlag_10_1_2`,`OM_CMN_NPDDesign`.`submittedToTelstraFlag_10_1_3` AS `submittedToTelstraFlag_10_1_3`,`OM_CMN_NPDDesign`.`partAResponseFlag` AS `partAResponseFlag`,`OM_CMN_NPDDesign`.`partBResponseFlag` AS `partBResponseFlag`,`OM_CMN_NPDDesign`.`isFinNoticeBoundaryEmailedToTls` AS `isFinNoticeBoundaryEmailedToTls`,`OM_CMN_NPDDesign`.`isOption3TLSRespReceived` AS `isOption3TLSRespReceived`,`OM_CMN_NPDDesign`.`isDuctReservationGMLApproved_10_1_1` AS `isDuctReservationGMLApproved_10_1_1`,`OM_CMN_NPDDesign`.`isFFSConfirm` AS `isFFSConfirm`,`OM_CMN_NPDDesign`.`reviewDesignApprovedFlag` AS `reviewDesignApprovedFlag`,`OM_CMN_NPDDesign`.`financeCode` AS `financeCode`,`OM_CMN_NPDDesign`.`macsMrq` AS `macsMrq`,`OM_CMN_NPDDesign`.`activeNetworkP6ProjectId` AS `activeNetworkP6ProjectId`,`OM_CMN_NPDDesign`.`laseTeamFeedbackFlag` AS `laseTeamFeedbackFlag`,`OM_CMN_NPDDesign`.`expectedCompletionDate` AS `expectedCompletionDate`,`OM_CMN_NPDDesign`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OM_CMN_NPDDesign`.`mrqId` AS `mrqId`,`OM_CMN_NPDDesign`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_NPDDesign`.`updatedOnDTime` AS `updatedOnDTime` from `OM_CMN_NPDDesign` ;

CREATE OR REPLACE VIEW OM_CMN_NpdPlanItem_View  AS  select `NpdPlan`.`id` AS `npdPlanId`,`NpdPlan`.`npdApplicationId` AS `npdApplicationId`,`NpdPlan`.`npdApplicationName` AS `npdApplicationName`,`NpdPlan`.`scopeOfWorkForDeliveryPartner` AS `scopeOfWorkForDeliveryPartner`,`NpdPlan`.`stateDeliveryRegion` AS `stateDeliveryRegion`,`NpdPlan`.`deliveryPartner` AS `deliveryPartner`,`NpdPlan`.`projectCode` AS `projectCode`,`NpdPlan`.`transitBuildType` AS `transitBuildType`,`NpdPlan`.`orderCategory` AS `orderCategory`,`NpdPlan`.`lowerRangeDays` AS `lowerRangeDays`,`NpdPlan`.`upperRangeDays` AS `upperRangeDays`,`NpdPlan`.`timeVarianceFlag` AS `timeVarianceFlag`,`NpdPlan`.`estimatedPassiveCost` AS `estimatedPassiveCost`,`NpdPlan`.`thresholdCost` AS `thresholdCost`,`NpdPlan`.`costVariance` AS `costVariance`,`NpdPlan`.`fbcDelta` AS `fbcDelta`,`NpdPlan`.`absorbFbcDelta` AS `absorbFbcDelta`,`NpdPlan`.`agreedRspFbcDelta` AS `agreedRspFbcDelta`,`NpdPlan`.`finalFbc` AS `finalFbc`,`NpdPlan`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 8)))) join `OM_CMN_NPDPlan` `NpdPlan` on((`NpdPlan`.`id` = `OI`.`entityId`))) ;

CREATE OR REPLACE VIEW OM_CMN_NPDPlan_View  AS  select `OM_CMN_NPDPlan`.`id` AS `id`,`OM_CMN_NPDPlan`.`npdApplicationId` AS `npdApplicationId`,`OM_CMN_NPDPlan`.`npdApplicationName` AS `npdApplicationName`,`OM_CMN_NPDPlan`.`itemId` AS `itemId`,`OM_CMN_NPDPlan`.`scopeOfWorkForDeliveryPartner` AS `scopeOfWorkForDeliveryPartner`,`OM_CMN_NPDPlan`.`stateDeliveryRegion` AS `stateDeliveryRegion`,`OM_CMN_NPDPlan`.`deliveryPartner` AS `deliveryPartner`,`OM_CMN_NPDPlan`.`projectCode` AS `projectCode`,`OM_CMN_NPDPlan`.`transitBuildType` AS `transitBuildType`,`OM_CMN_NPDPlan`.`orderCategory` AS `orderCategory`,`OM_CMN_NPDPlan`.`lowerRangeDays` AS `lowerRangeDays`,`OM_CMN_NPDPlan`.`upperRangeDays` AS `upperRangeDays`,`OM_CMN_NPDPlan`.`timeVarianceFlag` AS `timeVarianceFlag`,`OM_CMN_NPDPlan`.`estimatedPassiveCost` AS `estimatedPassiveCost`,`OM_CMN_NPDPlan`.`thresholdCost` AS `thresholdCost`,`OM_CMN_NPDPlan`.`costVariance` AS `costVariance`,`OM_CMN_NPDPlan`.`fbcDelta` AS `fbcDelta`,`OM_CMN_NPDPlan`.`absorbFbcDelta` AS `absorbFbcDelta`,`OM_CMN_NPDPlan`.`agreedRspFbcDelta` AS `agreedRspFbcDelta`,`OM_CMN_NPDPlan`.`finalFbc` AS `finalFbc`,`OM_CMN_NPDPlan`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OM_CMN_NPDPlan`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_NPDPlan`.`updatedOnDTime` AS `updatedOnDTime` from `OM_CMN_NPDPlan` ;

CREATE OR REPLACE VIEW OM_CMN_NS_NBNSelectItem_View  AS  select `NS`.`id` AS `nsId`,`NS`.`recordTypeRefId` AS `recordTypeRefId`,`NS`.`afterHoursSiteVisit` AS `afterHoursSiteVisit`,`NS`.`inductionRequired` AS `inductionRequired`,`NS`.`securityRequirements` AS `securityRequirements`,`NS`.`billingAccountID` AS `billingAccountID`,`NS`.`notes` AS `notes`,`NS`.`additionalNotes` AS `additionalNotes`,`NS`.`tradingName` AS `tradingName`,`NS`.`heritageSite` AS `heritageSite`,`NS`.`siteName` AS `siteName`,`NS`.`ownerAwareOfProposal` AS `ownerAwareOfProposal`,`NS`.`siteAccessInstructions` AS `siteAccessInstructions`,`NS`.`siteType` AS `siteType`,`NS`.`resourceOrderType` AS `resourceOrderType`,`NS`.`propertyOwnershipStatus` AS `propertyOwnershipStatus`,`NS`.`keysRequired` AS `keysRequired`,`NS`.`contractedLocationInstructions` AS `contractedLocationInstructions`,`NS`.`orderAcceptedFlag` AS `orderAcceptedFlag`,`NS`.`safetyHazards` AS `safetyHazards`,`NS`.`jsasswmRequired` AS `jsasswmRequired`,`NS`.`workPracticesRequired` AS `workPracticesRequired`,`NS`.`workingAtHeightsConsideration` AS `workingAtHeightsConsideration`,`NS`.`confinedSpaceRequirements` AS `confinedSpaceRequirements`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 6)))) join `OM_CMN_NBNSelect` `NS` on((`NS`.`id` = `OI`.`entityId`))) ;

CREATE OR REPLACE VIEW OM_CMN_NS_NpdConstructItem_View  AS  select `NpdConstruct`.`id` AS `npdConstructId`,`NpdConstruct`.`constructCommencementDate` AS `constructCommencementDate`,`NpdConstruct`.`pniUpdateDate` AS `pniUpdateDate`,`NpdConstruct`.`ntdInstalledDate` AS `ntdInstalledDate`,`NpdConstruct`.`rdCalledToNotifyVisTest` AS `rdCalledToNotifyVisTest`,`NpdConstruct`.`FODBoundaryExists` AS `FODBoundaryExists`,`NpdConstruct`.`testCompletionDate` AS `testCompletionDate`,`NpdConstruct`.`committedDeliveryDate` AS `committedDeliveryDate`,`NpdConstruct`.`networkTraceCompletionDate` AS `networkTraceCompletionDate`,`NpdConstruct`.`accessTechnologyCompletionDate` AS `accessTechnologyCompletionDate`,`NpdConstruct`.`submitCompletionFlag` AS `submitCompletionFlag`,`NpdConstruct`.`completionArtefactsApproved` AS `completionArtefactsApproved`,`NpdConstruct`.`transitionReportExportedBy` AS `transitionReportExportedBy`,`NpdConstruct`.`transitionExportedDate` AS `transitionExportedDate`,`NpdConstruct`.`bomboqApproved` AS `bomboqApproved`,`NTD`.`ntdInstallAppointmentDate` AS `ntdInstallAppointmentDate`,`NTD`.`ntdInstallAppointmentDTime_txt` AS `ntdInstallAppointmentDTime_txt`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId` from (((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 13)))) join `OM_CMN_NS_NPDConstruct` `NpdConstruct` on((`NpdConstruct`.`id` = `OI`.`entityId`))) join `OM_CMN_NS_NTDItem_View` `NTD` on((`OI`.`orderId` = `NTD`.`orderId`))) ;

CREATE OR REPLACE VIEW OM_CMN_NS_NPDPlanDesign_View  AS  select `NpdPlanDesign`.`id` AS `npdPlanDesignId`,`NpdPlanDesign`.`buildCategory` AS `buildCategory`,`NpdPlanDesign`.`avrRequired` AS `avrRequired`,`NpdPlanDesign`.`isFODBoundaryCreated` AS `isFODBoundaryCreated`,`NpdPlanDesign`.`workReleaseScheduled` AS `workReleaseScheduled`,`NpdPlanDesign`.`deliveryPartner` AS `deliveryPartner`,`NpdPlanDesign`.`isPONPatchingRequired` AS `isPONPatchingRequired`,`NpdPlanDesign`.`buildCategoryChange` AS `buildCategoryChange`,`NpdPlanDesign`.`revisedBuildCategory` AS `revisedBuildCategory`,`NpdPlanDesign`.`isBuildCategoryChangeAcknowledged` AS `isBuildCategoryChangeAcknowledged`,`NpdPlanDesign`.`buildCategoryWorkRelease` AS `buildCategoryWorkRelease`,`NpdPlanDesign`.`resolveDDDBuildCategory` AS `resolveDDDBuildCategory`,`NpdPlanDesign`.`costVariance` AS `costVariance`,`NpdPlanDesign`.`signedOffBy` AS `signedOffBy`,`NpdPlanDesign`.`approvedOrRejectDate` AS `approvedOrRejectDate`,`NpdPlanDesign`.`isTLSRequired` AS `isTLSRequired`,`NpdPlanDesign`.`tlsSubmitDate` AS `tlsSubmitDate`,`NpdPlanDesign`.`designOutcome` AS `designOutcome`,`NpdPlanDesign`.`isDesignRejectedAnyTime` AS `isDesignRejectedAnyTime`,`NpdPlanDesign`.`tlsApprovedDate` AS `tlsApprovedDate`,`NpdPlanDesign`.`proceedToConstruction` AS `proceedToConstruction`,`NpdPlanDesign`.`newBuildCost` AS `newBuildCost`,`NpdPlanDesign`.`costVarianceActionRequired` AS `costVarianceActionRequired`,`NpdPlanDesign`.`isRSPActionedAnyTime` AS `isRSPActionedAnyTime`,`NpdPlanDesign`.`tShirtClassificationFeasibility` AS `tShirtClassificationFeasibility`,`NpdPlanDesign`.`buildComplexity` AS `buildComplexity`,`NpdPlanDesign`.`buildComplexityPlanDesign` AS `buildComplexityPlanDesign`,`NpdPlanDesign`.`buildComplexityPlanDesignMgnt` AS `buildComplexityPlanDesignMgnt`,`NpdPlanDesign`.`plannedPlanCommenceDate` AS `plannedPlanCommenceDate`,`NpdPlanDesign`.`plannedPlanCompletionDate` AS `plannedPlanCompletionDate`,`NpdPlanDesign`.`deliveryPartnerPDP` AS `deliveryPartnerPDP`,`NpdPlanDesign`.`financeCode` AS `financeCode`,`NpdPlanDesign`.`macsMrq` AS `macsMrq`,`NpdPlanDesign`.`purchaseOrderId` AS `purchaseOrderId`,`NpdPlanDesign`.`workReleaseId` AS `workReleaseId`,`NpdPlanDesign`.`designVersionNumber` AS `designVersionNumber`,`NpdPlanDesign`.`bomboqVersionNumber` AS `bomboqVersionNumber`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 12)))) join `OM_CMN_NS_NPDPlanDesign` `NpdPlanDesign` on((`NpdPlanDesign`.`id` = `OI`.`entityId`))) order by `NpdPlanDesign`.`id` desc ;

CREATE OR REPLACE VIEW OM_CMN_NS_NTDItem_View  AS  select `NTD`.`id` AS `ntdId`,`NTD`.`recordTypeRefId` AS `recordTypeRefId`,`NTD`.`type` AS `type`,`NTD`.`batteryBackupRequired` AS `batteryBackupRequired`,`NTD`.`ntdInstallAppointmentDate` AS `ntdInstallAppointmentDate`,`NTD`.`ntdInstallAppointmentDTime_txt` AS `ntdInstallAppointmentDTime_txt`,`NTD`.`ntdPowerType` AS `ntdPowerType`,`NTD`.`ntdSerial` AS `ntdSerial`,`NTD`.`PSUSerialNumber` AS `PSUSerialNumber`,`NTD`.`testedUsingTemporaryPower` AS `testedUsingTemporaryPower`,`OI`.`orderId` AS `orderId`,`ORD`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId`,`LOC`.`locId` AS `locId` from ((((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 9)))) join `OM_CMN_NTD` `NTD` on((`NTD`.`id` = `OI`.`entityId`))) join `OM_CMN_Order` `ORD` on((`ORD`.`id` = `OI`.`orderId`))) left join `OM_CMN_Location` `LOC` on((`LOC`.`id` = `ORD`.`locationId`))) order by `NTD`.`id` desc ;

CREATE OR REPLACE VIEW OM_CMN_OrderItem2_View  AS  select `OM_CMN_OrderItem`.`id` AS `id`,`OM_CMN_OrderItem`.`orderId` AS `orderId`,`OM_CMN_OrderItem`.`itemTypeRefId` AS `itemTypeRefId`,`OM_CMN_OrderItem`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OM_CMN_FUNC_ReturnInt`(`OM_CMN_OrderItem`.`locationId`) AS `locationId`,`OM_CMN_OrderItem`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_OrderItem`.`idx` AS `idx`,`OM_CMN_OrderItem`.`parentOrderItemId` AS `parentOrderItemId`,`OM_CMN_OrderItem`.`omId` AS `omId`,`OM_CMN_OrderItem`.`mainLineItemFlag` AS `mainLineItemFlag`,`OM_CMN_OrderItem`.`hideSummaryRowFlag` AS `hideSummaryRowFlag`,`OM_CMN_OrderItem`.`action` AS `action`,`OM_CMN_OrderItem`.`state` AS `state`,`OM_CMN_OrderItem`.`priority` AS `priority`,`OM_CMN_OrderItem`.`completionDate` AS `completionDate`,`OM_CMN_OrderItem`.`expectedCompletionDate` AS `expectedCompletionDate`,`OM_CMN_OrderItem`.`requestedCompletionDate` AS `requestedCompletionDate`,`OM_CMN_OrderItem`.`requestedStartDate` AS `requestedStartDate`,`OM_CMN_OrderItem`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_OrderItem`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_OrderItem`.`entityId` AS `entityId` from `OM_CMN_OrderItem` ;

CREATE OR REPLACE VIEW OM_CMN_OrderItem_View  AS  select `ORD`.`id` AS `orderId`,`ORD`.`omId` AS `nbnOrderId`,`ORD`.`correlationId` AS `correlationId`,`ORD`.`correlationName` AS `correlationName`,`OI`.`entityId` AS `entityId`,`ORD`.`statusId` AS `statusId`,`ORD`.`orderDate` AS `orderDate`,`ORD`.`acknowledgedDate` AS `acknowledgedDate`,`ORD`.`expectedCompletionDate` AS `expectedCompletionDate`,`ORD`.`requestedCompletionDate` AS `requestedCompletionDate`,`ORD`.`completionDate` AS `completionDate`,`ORD`.`priId` AS `priId`,`ORD`.`substatusId` AS `substatusId`,`ORD`.`name` AS `name`,`ORD`.`orderType` AS `orderType`,`ORD`.`orderSubType` AS `orderSubType`,`ORD`.`orderTypeRefId` AS `orderTypeRefId`,`ORD`.`itemSubTypeRefId` AS `orderItemSubTypeRefId`,`ORD`.`falloutFlag` AS `falloutFlag`,`ORD`.`pendFlag` AS `pendFlag`,`ORD`.`subprocessPendFlag` AS `subprocessPendFlag`,`ORD`.`USRN` AS `USRN`,`ORD`.`afterHoursProcessing` AS `afterHoursProcessing`,`deal`.`dealName` AS `dealName`,`AP`.`id` AS `applicationId`,`AP`.`omId` AS `applicationOmId`,`OI`.`mainLineItemFlag` AS `mainLineItemFlag`,`OI`.`state` AS `state`,`OI`.`id` AS `orderItemId`,`OI`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`LOC`.`id` AS `locationId`,`LOC`.`locId` AS `locId`,`LOC`.`locationType` AS `locationType`,`LOC`.`longitude` AS `longitude`,`LOC`.`latitude` AS `latitude`,`LOC`.`addressFullText` AS `address`,`LOC`.`csaId` AS `csaId`,`LOC`.`samId` AS `samId`,`LOC`.`accessTechnologyType` AS `accessTechnologyType`,`LOC`.`serviceRegion` AS `serviceRegion` from ((((`OM_CMN_Order` `ORD` left join `OM_CMN_Application` `AP` on((`ORD`.`applicationId` = `AP`.`id`))) left join `OM_CMN_Location` `LOC` on((`LOC`.`id` = `ORD`.`locationId`))) left join `OM_CMN_OrderItem` `OI` on((`ORD`.`id` = `OI`.`orderId`))) left join `OM_CMN_Deal` `deal` on((`ORD`.`dealId` = `deal`.`id`))) ;

CREATE OR REPLACE VIEW OM_CMN_Order_View  AS  select `OM_CMN_Order`.`id` AS `id`,`OM_CMN_Order`.`omId` AS `omId`,`OM_CMN_Order`.`statusVersionId` AS `statusVersionId`,`OM_CMN_Order`.`correlationId` AS `correlationId`,`OM_CMN_Order`.`correlationName` AS `correlationName`,`OM_CMN_Order`.`appianFolderId` AS `appianFolderId`,`OM_CMN_Order`.`statusId` AS `statusId`,`OM_CMN_Order`.`substatusId` AS `substatusId`,`OM_CMN_Order`.`locationId` AS `locationId`,`OM_CMN_Order`.`orderTypeRefId` AS `orderTypeRefId`,`OM_CMN_Order`.`state` AS `state`,`OM_CMN_Order`.`name` AS `name`,`OM_CMN_Order`.`description` AS `description`,`OM_CMN_Order`.`priority` AS `priority`,`OM_CMN_Order`.`orderDate` AS `orderDate`,`OM_CMN_Order`.`acknowledgedDate` AS `acknowledgedDate`,`OM_CMN_Order`.`expectedCompletionDate` AS `expectedCompletionDate`,`OM_CMN_Order`.`completionDate` AS `completionDate`,`OM_CMN_Order`.`requestedStartDate` AS `requestedStartDate`,`OM_CMN_Order`.`requestedCompletionDate` AS `requestedCompletionDate`,`OM_CMN_Order`.`updatedBy` AS `updatedBy`,`OM_CMN_Order`.`createdBy` AS `createdBy`,`OM_CMN_Order`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_Order`.`productHeaderId` AS `productHeaderId`,`OM_CMN_Order`.`priId` AS `priId`,`OM_CMN_Order`.`orderType` AS `orderType`,`OM_CMN_Order`.`orderSubType` AS `orderSubType`,`OM_CMN_FUNC_ReturnInt`(`OM_CMN_Order`.`applicationId`) AS `applicationId`,`OM_CMN_Order`.`accessSeekerContactId` AS `accessSeekerContactId`,`OM_CMN_Order`.`accessSeekerId` AS `accessSeekerId`,`OM_CMN_Order`.`pendFlag` AS `pendFlag`,`OM_CMN_Order`.`opoAppianDocId` AS `opoAppianDocId`,`OM_CMN_Order`.`npdStatusId` AS `npdStatusId`,`OM_CMN_Order`.`npdSubstatusId` AS `npdSubstatusId`,`OM_CMN_Order`.`sendNotificationsFlag` AS `sendNotificationsFlag`,`OM_CMN_Order`.`finalStatusCompletedFlag` AS `finalStatusCompletedFlag`,`OM_CMN_Order`.`parentOrderId` AS `parentOrderId`,`OM_CMN_Order`.`subprocessPendFlag` AS `subprocessPendFlag`,`OM_CMN_Order`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_Order`.`deleteFlag` AS `deleteFlag`,`OM_CMN_Order`.`channel` AS `channel`,`OM_CMN_Order`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`OM_CMN_Order`.`shortfallType` AS `shortfallType`,`OM_CMN_Order`.`falloutFlag` AS `falloutFlag` from `OM_CMN_Order` ;

CREATE OR REPLACE VIEW OM_CMN_OVCConfigure_View  AS  select `OVC`.`id` AS `ovcId`,`OVC`.`ovcConfiguredFlag` AS `ovcConfiguredFlag`,`O`.`id` AS `orderId`,`O`.`omId` AS `orderDisplayId`,`O`.`correlationId` AS `correlationId`,`O`.`orderType` AS `orderType`,`OI`.`action` AS `action`,`OI`.`omId` AS `ovcDisplayId`,`OI`.`id` AS `itemId` from (((`OM_CMN_Order` `O` join `OM_CMN_OrderItem` `OI` on((`O`.`id` = `OI`.`orderId`))) join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 4)))) join `OM_CMN_OVC` `OVC` on((`OVC`.`id` = `OI`.`entityId`))) where ((`O`.`orderType` = 'Modify') and (`OI`.`action` = 'MODIFY')) ;


CREATE OR REPLACE VIEW OM_CMN_OVC_View  AS  select `OM_CMN_OVC`.`id` AS `id`,`OM_CMN_OVC`.`uniId` AS `uniId`,`OM_CMN_OVC`.`itemId` AS `itemId`,`OM_CMN_OVC`.`idx` AS `idx`,`OM_CMN_OVC`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_OVC`.`poi` AS `poi`,`OM_CMN_OVC`.`nni` AS `nni`,`OM_CMN_OVC`.`routeType` AS `routeType`,`OM_CMN_OVC`.`sVLanId` AS `sVLanId`,`OM_CMN_OVC`.`maximumFrameSize` AS `maximumFrameSize`,`OM_CMN_OVC`.`cosHighBandwidth` AS `cosHighBandwidth`,`OM_CMN_OVC`.`cosMediumBandwidth` AS `cosMediumBandwidth`,`OM_CMN_OVC`.`cosLowBandwidth` AS `cosLowBandwidth`,`OM_CMN_OVC`.`uniVLanId` AS `uniVLanId`,`OM_CMN_OVC`.`connectedTo` AS `connectedTo`,`OM_CMN_OVC`.`enniLagId` AS `enniLagId`,`OM_CMN_OVC`.`ovcTransientId` AS `ovcTransientId`,`OM_CMN_OVC`.`cncId` AS `cncId`,`OM_CMN_OVC`.`cosMappingMode` AS `cosMappingMode`,`OM_CMN_OVC`.`samInstanceId` AS `samInstanceId`,`OM_CMN_OVC`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_OVC`.`createdBy` AS `createdBy`,`OM_CMN_OVC`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_OVC`.`updatedBy` AS `updatedBy`,`OM_CMN_OVC`.`orderId` AS `orderId`,`OM_CMN_OVC`.`ovcConfiguredFlag` AS `ovcConfiguredFlag`,`OM_CMN_OVC`.`itemSubTypeRefId` AS `itemSubTypeRefId` from `OM_CMN_OVC` ;

CREATE OR REPLACE VIEW OM_CMN_ProductOrder_View  AS  select `ORD`.`id` AS `orderId`,`ORD`.`omId` AS `nbnOrderId`,`ORD`.`correlationId` AS `correlationId`,`ORD`.`correlationName` AS `correlationName`,`ORD`.`statusId` AS `statusId`,`ORD`.`orderDate` AS `orderDate`,`ORD`.`requestedCompletionDate` AS `requestedCompletionDate`,`ORD`.`completionDate` AS `completionDate`,`ORD`.`priId` AS `priId`,`ORD`.`substatusId` AS `substatusId`,`ORD`.`name` AS `name`,`ORD`.`npdStatusId` AS `npdStatusId`,`ORD`.`orderTypeRefId` AS `orderTypeRefId`,`ORD`.`orderType` AS `orderType`,`ORD`.`statusVersionId` AS `statusVersionId`,`AP`.`id` AS `applicationId`,`AP`.`omId` AS `applicationOmId`,`OI`.`mainLineItemFlag` AS `mainLineItemFlag`,`OI`.`state` AS `state`,`OI`.`id` AS `orderItemId`,`OI`.`itemSubTypeRefId` AS `itemSubTypeRefId`,`LOC`.`id` AS `locationId`,`LOC`.`locId` AS `locId`,`LOC`.`locationType` AS `locationType`,`LOC`.`longitude` AS `longitude`,`LOC`.`latitude` AS `latitude`,`EE`.`afterHoursAppointment` AS `afterHoursAppointment`,`EE`.`inductionRequired` AS `inductionRequired`,`EE`.`securityClearance` AS `securityClearance`,`EE`.`notes` AS `notes`,`EE`.`tradingName` AS `tradingName`,`EE`.`heritageSite` AS `heritageSite`,`EE`.`term` AS `term`,`EE`.`serviceRestorationSLA` AS `serviceRestorationSLA`,`EE`.`accessAvailabilityTarget` AS `accessAvailabilityTarget`,`EE`.`zone` AS `zone`,`EE`.`productType` AS `productType`,`EE`.`informPlanDesignFlag` AS `informPlanDesignFlag`,`EE`.`informDPCommercialFlag` AS `informDPCommercialFlag` from (((((`OM_CMN_Order` `ORD` left join `OM_CMN_Application` `AP` on((`ORD`.`applicationId` = `AP`.`id`))) left join `OM_CMN_Location` `LOC` on((`LOC`.`id` = `ORD`.`locationId`))) join `OM_CMN_OrderItem` `OI` on((`ORD`.`id` = `OI`.`orderId`))) join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 1)))) join `OM_CMN_EnterpriseEthernet` `EE` on((`OI`.`entityId` = `EE`.`id`))) ;

CREATE OR REPLACE VIEW OM_CMN_RecentRecord_View  AS  select distinct uuid() AS `id`,'OM_CMN' AS `appPrefix`,`a`.`recordTypeRefId` AS `recordTypeRefId`,`a`.`recordId` AS `recordId`,`a`.`createdBy` AS `createdBy`,(case when (`a`.`recordTypeRefId` = 1) then `app`.`omId` else `o`.`omId` end) AS `displayId` from ((`OM_CMN_Audit` `a` left join `OM_CMN_Order` `o` on(((`o`.`id` = `a`.`recordId`) and (`a`.`recordTypeRefId` = 2)))) left join `OM_CMN_Application` `app` on(((`app`.`id` = `a`.`recordId`) and (`a`.`recordTypeRefId` = 1)))) order by `a`.`createdOnDTime` desc ;

CREATE OR REPLACE VIEW OM_CMN_RPT_Order_View  AS  select `ORD`.`id` AS `orderId`,`ORD`.`omId` AS `nbnOrderId`,`ORD`.`correlationId` AS `correlationId`,`ORD`.`correlationName` AS `correlationName`,`ORD`.`statusId` AS `statusId`,`ORD`.`orderDate` AS `orderDate`,`ORD`.`requestedCompletionDate` AS `requestedCompletionDate`,`ORD`.`completionDate` AS `completionDate`,`ORD`.`priId` AS `priId`,`ORD`.`substatusId` AS `substatusId`,`ORD`.`name` AS `name`,`AP`.`id` AS `applicationId`,`AP`.`omId` AS `applicationOmId`,`LOC`.`id` AS `locationId`,`LOC`.`locId` AS `locId`,`LOC`.`locationType` AS `locationType`,`LOC`.`longitude` AS `longitude`,`LOC`.`latitude` AS `latitude`,`LOC`.`csaId` AS `csaId`,`LOC`.`samId` AS `samId`,`LOC`.`accessTechnologyType` AS `accessTechnologyType`,`LOC`.`state` AS `state`,`LOC`.`postcode` AS `postcode`,`status`.`name` AS `status`,`substatus`.`name` AS `substatus`,`orderType`.`name` AS `omOrderType` from (((((`OM_CMN_Order` `ORD` left join `OM_CMN_Location` `LOC` on((`LOC`.`id` = `ORD`.`locationId`))) left join `OM_CMN_Application` `AP` on((`ORD`.`applicationId` = `AP`.`id`))) join `OM_CMN_R_StatusRef` `status` on((`status`.`id` = `ORD`.`statusId`))) join `OM_CMN_R_SubstatusRef` `substatus` on((`substatus`.`id` = `ORD`.`substatusId`))) join `OM_CMN_R_OrderTypeRef` `orderType` on((`orderType`.`id` = `ORD`.`orderTypeRefId`))) ;

CREATE OR REPLACE VIEW OM_CMN_ServiceLog_View  AS  select `OM_CMN_ServiceLog`.`id` AS `id`,`OM_CMN_ServiceLog`.`requestId` AS `requestId`,`OM_CMN_ServiceLog`.`startTime` AS `startTime`,`OM_CMN_ServiceLog`.`endTime` AS `endTime`,`OM_CMN_ServiceLog`.`errorOccurred` AS `errorOccurred`,`OM_CMN_ServiceLog`.`requestObject` AS `requestObject`,`OM_CMN_ServiceLog`.`responseObject` AS `responseObject`,`OM_CMN_ServiceLog`.`correlationId` AS `correlationId`,`OM_CMN_ServiceLog`.`serviceTypeId` AS `serviceTypeId`,`OM_CMN_ServiceLog`.`createdBy` AS `createdBy`,`OM_CMN_ServiceLog`.`createdOn` AS `createdOn`,`OM_CMN_ServiceLog`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_ServiceLog`.`retryCount` AS `retryCount`,`OM_CMN_ServiceLog`.`appianProcessId` AS `appianProcessId`,`OM_CMN_ServiceLog`.`entityId` AS `entityId`,`OM_CMN_ServiceLog`.`productType` AS `productType`,`OM_CMN_ServiceLog`.`requestJson` AS `requestJson`,`OM_CMN_ServiceLog`.`responseJson` AS `responseJson`,`OM_CMN_ServiceLog`.`notificationType` AS `notificationType`,`OM_CMN_ServiceLog`.`processName` AS `processName`,`OM_CMN_ServiceLog`.`testCaseFlag` AS `testCaseFlag` from `OM_CMN_ServiceLog` ;

CREATE OR REPLACE VIEW OM_CMN_StatusVersion_View  AS  select distinct uuid() AS `uuid`,`v`.`id` AS `versionId`,`s`.`id` AS `id`,`s`.`name` AS `name`,`v`.`versionNo` AS `versionNo`,`v`.`name` AS `versionName`,`p`.`name` AS `productName`,`v`.`mpoOrderType` AS `mpoOrderType`,`orderType`.`name` AS `omOrderType`,`s`.`statusTypeRef` AS `statusTypeRef` from (((((`OM_CMN_R_StatusVersionRef` `v` join `OM_CMN_R_OrderTypeRef` `orderType` on((`orderType`.`id` = `v`.`orderTypeRefId`))) join `OM_CMN_R_ItemSubTypeRef` `p` on((`p`.`id` = `v`.`productId`))) join `OM_CMN_R_StatusVersionLinkRef` `l` on((`l`.`statusVersionRefId` = `v`.`id`))) join `OM_CMN_R_SubstatusRef` `sub` on(((`l`.`substatusRefId` = `sub`.`id`) and (`sub`.`isActiveFlag` = TRUE)))) join `OM_CMN_R_StatusRef` `s` on((`s`.`id` = `sub`.`statusRefId`))) order by `s`.`statusTypeRef`,`s`.`sortOrder` ;

CREATE OR REPLACE VIEW OM_CMN_SubstatusVersion_View  AS  select `v`.`id` AS `versionId`,`sub`.`id` AS `id`,`sub`.`name` AS `name`,`sub`.`sortOrder` AS `sortOrder`,`v`.`versionNo` AS `versionNo`,`v`.`name` AS `versionName`,`p`.`name` AS `productName`,`v`.`mpoOrderType` AS `mpoOrderType`,`orderType`.`name` AS `omOrderType`,`s`.`statusTypeRef` AS `statusTypeRef`,`s`.`name` AS `parentStatus`,`s`.`id` AS `parentStatusId` from (((((`OM_CMN_R_StatusVersionRef` `v` join `OM_CMN_R_OrderTypeRef` `orderType` on((`orderType`.`id` = `v`.`orderTypeRefId`))) join `OM_CMN_R_ItemSubTypeRef` `p` on((`p`.`id` = `v`.`productId`))) join `OM_CMN_R_StatusVersionLinkRef` `l` on((`l`.`statusVersionRefId` = `v`.`id`))) join `OM_CMN_R_SubstatusRef` `sub` on(((`l`.`substatusRefId` = `sub`.`id`) and (`sub`.`name` is not null) and (`sub`.`isActiveFlag` = TRUE)))) join `OM_CMN_R_StatusRef` `s` on((`s`.`id` = `sub`.`statusRefId`))) order by `s`.`statusTypeRef`,`s`.`sortOrder`,`sub`.`sortOrder` ;

CREATE OR REPLACE VIEW OM_CMN_Substatus_View  AS  select `substatus`.`id` AS `id`,`substatus`.`name` AS `name`,`status`.`statusTypeRef` AS `statusTypeRef`,`status`.`sortOrder` AS `statusSortOrder`,concat(`status`.`name`,'-',`substatus`.`name`) AS `statusName`,`substatus`.`sortOrder` AS `substatusSortOrder` from (`OM_CMN_R_SubstatusRef` `substatus` join `OM_CMN_R_StatusRef` `status` on((`substatus`.`statusRefId` = `status`.`id`))) ;

CREATE OR REPLACE VIEW OM_CMN_UNIItem_View  AS  select `UNI`.`id` AS `uniId`,`UNI`.`interfaceBandwidth` AS `interfaceBandwidth`,`UNI`.`portId` AS `portId`,`UNI`.`interfaceType` AS `interfaceType`,`UNI`.`ovcType` AS `ovcType`,`UNI`.`tpId` AS `tpId`,`UNI`.`transientId` AS `transientId`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId` from ((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 3)))) join `OM_CMN_UNI` `UNI` on((`UNI`.`id` = `OI`.`entityId`))) ;

CREATE OR REPLACE VIEW OM_CMN_UNI_View  AS  select `OM_CMN_UNI`.`id` AS `id`,`OM_CMN_UNI`.`btdId` AS `btdId`,`OM_CMN_UNI`.`itemId` AS `itemId`,`OM_CMN_UNI`.`recordTypeRefId` AS `recordTypeRefId`,`OM_CMN_UNI`.`interfaceBandwidth` AS `interfaceBandwidth`,`OM_CMN_UNI`.`portId` AS `portId`,`OM_CMN_UNI`.`interfaceType` AS `interfaceType`,`OM_CMN_UNI`.`ovcType` AS `ovcType`,`OM_CMN_UNI`.`tpId` AS `tpId`,`OM_CMN_UNI`.`transientId` AS `transientId`,`OM_CMN_UNI`.`createdOnDTime` AS `createdOnDTime`,`OM_CMN_UNI`.`createdBy` AS `createdBy`,`OM_CMN_UNI`.`updatedOnDTime` AS `updatedOnDTime`,`OM_CMN_UNI`.`updatedBy` AS `updatedBy`,`OM_CMN_UNI`.`orderId` AS `orderId`,`OM_CMN_UNI`.`itemSubTypeRefId` AS `itemSubTypeRefId` from `OM_CMN_UNI` ;

CREATE OR REPLACE VIEW OM_CMN_UUID_View  AS  select uuid() AS `UUID` ;

-- 1906 EE

CREATE OR REPLACE VIEW `OM_CMN_OrderLocation_View` AS
SELECT
    `ORD`.`id` AS `orderId`,
    `ORD`.`omId` AS `nbnOrderId`,
    `ORD`.`correlationId` AS `correlationId`,
    `ORD`.`correlationName` AS `correlationName`,
    `ORD`.`statusId` AS `statusId`,
    `ORD`.`orderDate` AS `orderDate`,
    `ORD`.`requestedCompletionDate` AS `requestedCompletionDate`,
    `ORD`.`completionDate` AS `completionDate`,
    `ORD`.`priId` AS `priId`,
    `ORD`.`substatusId` AS `substatusId`,
    `ORD`.`npdSubstatusId` AS `npdSubstatusId`,
    `ORD`.`name` AS `name`,
    `ORD`.`deleteFlag` AS `deleteFlag`,
    `ORD`.`itemSubTypeRefId` AS `itemSubTypeRefId`,
    `ORD`.`orderTypeRefId` AS `orderTypeRefId`,
    `ORD`.`expectedCompletionDate` AS `expectedCompletionDate`,
    `ORD`.`custPendFlag` AS `custPendFlag`,
    `ORD`.`USRN` AS `USRN`,
    `deal`.`dealName` AS `dealName`,
    `AP`.`id` AS `applicationId`,
    `AP`.`omId` AS `applicationOmId`,
    `LOC`.`id` AS `locationId`,
    `LOC`.`locId` AS `locId`,
    `LOC`.`samId` AS `samId`,
    `LOC`.`addressFullText` AS `addressFullText`,
    `sec`.`username` AS `securityUsernameOrGroup`,
    `npdPlan`.`stateDeliveryRegion` AS `stateDeliveryRegion`,
    `npdPlan`.`deliveryPartner` AS `deliveryPartner`,
    `NSPlan`.`deliveryPartner` AS `nsDeliveryPartner`,
    `npdDesign`.`mrqId` AS `mrqId`,
    `NSPlan`.`macsMrq` AS `nsMrq`,
    `EE`.`tradingName` AS `tradingName`,
    `NS`.`tradingName` AS `nsTradingName`
FROM
    (
        (
            (
                (
                    (
                        (
                            (
                                (
                                    (
                                        (
                                            (
                                                (
                                                    (
                                                        (
                                                            `Appian`.`OM_CMN_Order` `ORD`
                                                        LEFT JOIN `Appian`.`OM_CMN_Location` `LOC`
                                                        ON
                                                            ((`LOC`.`id` = `ORD`.`locationId`))
                                                        )
                                                    LEFT JOIN `Appian`.`OM_CMN_Application` `AP`
                                                    ON
                                                        ((`ORD`.`applicationId` = `AP`.`id`))
                                                    )
                                                JOIN `Appian`.`OM_CMN_OrderSecurity` `sec`
                                                ON
                                                    ((`sec`.`orderId` = `ORD`.`id`))
                                                )
                                            LEFT JOIN `Appian`.`OM_CMN_OrderItem` `npdPlanOI`
                                            ON
                                                (
                                                    (
                                                        (`ORD`.`id` = `npdPlanOI`.`orderId`) AND(`npdPlanOI`.`itemSubTypeRefId` = 8)
                                                    )
                                                )
                                            )
                                        LEFT JOIN `Appian`.`OM_CMN_NPDPlan` `npdPlan`
                                        ON
                                            (
                                                (
                                                    `npdPlanOI`.`entityId` = `npdPlan`.`id`
                                                )
                                            )
                                        )
                                    LEFT JOIN `Appian`.`OM_CMN_OrderItem` `npdDesignOI`
                                    ON
                                        (
                                            (
                                                (`ORD`.`id` = `npdDesignOI`.`orderId`) AND(
                                                    `npdDesignOI`.`itemSubTypeRefId` = 10
                                                )
                                            )
                                        )
                                    )
                                LEFT JOIN `Appian`.`OM_CMN_NPDDesign` `npdDesign`
                                ON
                                    (
                                        (
                                            `npdDesignOI`.`entityId` = `npdDesign`.`id`
                                        )
                                    )
                                )
                            LEFT JOIN `Appian`.`OM_CMN_OrderItem` `EEOI`
                            ON
                                (
                                    (
                                        (`ORD`.`id` = `EEOI`.`orderId`) AND(`EEOI`.`itemSubTypeRefId` = 1)
                                    )
                                )
                            )
                        LEFT JOIN `Appian`.`OM_CMN_EnterpriseEthernet` `EE`
                        ON
                            ((`EEOI`.`entityId` = `EE`.`id`))
                        )
                    LEFT JOIN `Appian`.`OM_CMN_OrderItem` `NSOI`
                    ON
                        (
                            (
                                (`ORD`.`id` = `NSOI`.`orderId`) AND(`NSOI`.`itemSubTypeRefId` = 6)
                            )
                        )
                    )
                LEFT JOIN `Appian`.`OM_CMN_NBNSelect` `NS`
                ON
                    ((`NSOI`.`entityId` = `NS`.`id`))
                )
            LEFT JOIN `Appian`.`OM_CMN_OrderItem` `NSPlanOI`
            ON
                (
                    (
                        (`ORD`.`id` = `NSPlanOI`.`orderId`) AND(`NSPlanOI`.`itemSubTypeRefId` = 12)
                    )
                )
            )
        LEFT JOIN `Appian`.`OM_CMN_NS_NPDPlanDesign` `NSPlan`
        ON
            (
                (`NSPlanOI`.`entityId` = `NSPlan`.`id`)
            )
        )
    LEFT JOIN `Appian`.`OM_CMN_Deal` `deal`
    ON
        ((`ORD`.`dealId` = `deal`.`id`))
    );

CREATE OR REPLACE VIEW `OM_CMN_PendHold_View` AS SELECT
    `ph`.`id` AS `id`,
    `ph`.`orderId` AS `orderId`,
    `ph`.`reasonCodeRefId` AS `reasonCodeRefId`,
    `rc`.`code` AS `code`,
    `rc`.`description` AS `description`,
    `lookup`.`label` AS `reasonCodeType`,
    `ph`.`pendHoldDTime` AS `pendHoldDTime`,
    `ph`.`createdBy` AS `createdBy`,
    `ph`.`createdOnDTime` AS `createdOnDTime`,
    `ph`.`updatedOnDTime` AS `updatedOnDTime`,
    `ph`.`updatedBy` AS `updatedBy`
FROM
    (
        (
            `Appian`.`OM_CMN_PendHold` `ph`
        JOIN `Appian`.`OM_CMN_R_ReasonCodeRef` `rc`
        ON
            ((`rc`.`id` = `ph`.`reasonCodeRefId`))
        )
    JOIN `Appian`.`OM_CMN_R_LookupRef` `lookup`
    ON
        ((`rc`.`typeRefId` = `lookup`.`id`))
    );


CREATE
	OR REPLACE VIEW OM_CMN_ReasonCodeRef_View AS
SELECT
    `rc`.`id` AS `id`,
    `rc`.`code` AS `code`,
    `rc`.`description` AS `description`,
    `rc`.`typeRefId` AS `typeRefId`,
    `rc`.`resumeReasonCodeRefId` AS `resumeReasonCodeRefId`,
    `lookup`.`label` AS `typeRefName`,
    `rc`.`createdBy` AS `createdBy`,
    `rc`.`createdOnDTime` AS `createdOnDTime`,
    `rc`.`updatedOnDTime` AS `updatedOnDTime`,
    `rc`.`updatedBy` AS `updatedBy`
FROM
    (
        `OM_CMN_R_ReasonCodeRef` `rc`
    JOIN `OM_CMN_R_LookupRef` `lookup` ON
        ((`rc`.`typeRefId` = `lookup`.`id`))
    );
	
CREATE OR REPLACE VIEW `OM_CMN_OVCItem_View`  AS  select `OVC`.`id` AS `ovcId`,`OVC`.`poi` AS `poi`,`OVC`.`nni` AS `nni`,`OVC`.`routeType` AS `routeType`,`OVC`.`sVLanId` AS `sVLanId`,`OVC`.`maximumFrameSize` AS `maximumFrameSize`,`OVC`.`cosHighBandwidth` AS `cosHighBandwidth`,`OVC`.`cosMediumBandwidth` AS `cosMediumBandwidth`,`OVC`.`cosLowBandwidth` AS `cosLowBandwidth`,`OVC`.`uniVLanId` AS `uniVLanId`,`OVC`.`connectedTo` AS `connectedTo`,`OVC`.`enniLagId` AS `enniLagId`,`OVC`.`ovcTransientId` AS `ovcTransientId`,`OI`.`orderId` AS `orderId`,`OI`.`omId` AS `omId`,`OI`.`action` AS `action`,`OI`.`id` AS `itemId`,`CNC`.`id` AS `cncId`,`CNC`.`itemId` AS `cncItemId`,`OIC`.`omId` AS `cncOmId`,`OVC`.`cosMappingMode` AS `cosMappingMode`,`OVC`.`samInstanceId` AS `samInstanceId`,`OVC`.`nasId` AS `nasId`,`OVC`.`subscriberId` AS `subscriberId`,`OVC`.`inniSVLanId` AS `inniSVLanId` from ((((`OM_CMN_OrderItem` `OI` join `OM_CMN_R_ItemSubTypeRef` `subtype` on(((`OI`.`itemSubTypeRefId` = `subtype`.`id`) and (`subtype`.`id` = 4)))) join `OM_CMN_OVC` `OVC` on((`OVC`.`id` = `OI`.`entityId`))) left join `OM_CMN_CNC` `CNC` on((`OVC`.`cncId` = `CNC`.`id`))) left join `OM_CMN_OrderItem` `OIC` on((`CNC`.`itemId` = `OIC`.`id`))) ;	

-- 1906 NPD 
CREATE OR REPLACE
 VIEW `OM_CMN_NpdDesignItem_View`
 AS SELECT
    `NpdDesign`.`id` AS `npdDesignId`,
    `NpdDesign`.`ffsMandRequiredFlag` AS `ffsMandRequiredFlag`,
    `NpdDesign`.`ffsNonMandRequiredFlag` AS `ffsNonMandRequiredFlag`,
    `NpdDesign`.`ffsMandatoryCost` AS `ffsMandatoryCost`,
    `NpdDesign`.`ffsNonMandatoryCost` AS `ffsNonMandatoryCost`,
    `NpdDesign`.`isTLSRespReceived` AS `isTLSRespReceived`,
    `NpdDesign`.`isBTDDesignComplete` AS `isBTDDesignComplete`,
    `NpdDesign`.`submittedToTelstraFlag_10_1_2` AS `submittedToTelstraFlag_10_1_2`,
    `NpdDesign`.`submittedToTelstraFlag_10_1_3` AS `submittedToTelstraFlag_10_1_3`,
    `NpdDesign`.`partAResponseFlag` AS `partAResponseFlag`,
    `NpdDesign`.`partBResponseFlag` AS `partBResponseFlag`,
    `NpdDesign`.`isFinNoticeBoundaryEmailedToTls` AS `isFinNoticeBoundaryEmailedToTls`,
    `NpdDesign`.`isOption3TLSRespReceived` AS `isOption3TLSRespReceived`,
    `NpdDesign`.`isDuctReservationGMLApproved_10_1_1` AS `isDuctReservationGMLApproved_10_1_1`,
    `NpdDesign`.`isFFSConfirm` AS `isFFSConfirm`,
    `NpdDesign`.`reviewDesignApprovedFlag` AS `reviewDesignApprovedFlag`,
    `NpdDesign`.`financeCode` AS `financeCode`,
    `OI`.`orderId` AS `orderId`,
    `OI`.`omId` AS `omId`,
    `OI`.`action` AS `action`,
    `OI`.`id` AS `itemId`,
    `NpdDesign`.`macsMrq` AS `macsMrq`,
    `NpdDesign`.`activeNetworkP6ProjectId` AS `activeNetworkP6ProjectId`,
    `NpdDesign`.`laseTeamFeedbackFlag` AS `laseTeamFeedbackFlag`,
    `NpdDesign`.`expectedCompletionDate` AS `expectedCompletionDate`,
    `NpdDesign`.`itemSubTypeRefId` AS `itemSubTypeRefId`,
    `NpdDesign`.`mrqId` AS `mrqId`,
    `NpdDesign`.`designOutcome` AS `designOutcome`,
    `NpdDesign`.`purchaseOrderId` AS `purchaseOrderId`,
    `NpdDesign`.`workReleaseId` AS `workReleaseId`,
    `NpdDesign`.`designVersionNumber` AS `designVersionNumber`,
    `NpdDesign`.`bomboqVersionNumber` AS `bomboqVersionNumber`
FROM
    (
        (
            `Appian`.`OM_CMN_OrderItem` `OI`
        JOIN `Appian`.`OM_CMN_R_ItemSubTypeRef` `subtype`
        ON
            (
                (
                    (
                        `OI`.`itemSubTypeRefId` = `subtype`.`id`
                    ) AND(`subtype`.`id` = 10)
                )
            )
        )
    JOIN `Appian`.`OM_CMN_NPDDesign` `NpdDesign`
    ON
        ((`NpdDesign`.`id` = `OI`.`entityId`))
    );

    CREATE OR REPLACE VIEW `OM_CMN_ContactItem_View` AS SELECT
        `contact`.`id` AS `id`,
        `contact`.`itemId` AS `itemId`,
        `OI`.`recordTypeRefId` AS `recordTypeRefId`,
        `contact`.`type` AS `type`,
        `contact`.`contactName` AS `contactName`,
        `contact`.`role` AS `role`,
        `contact`.`emailAddress` AS `emailAddress`,
        `contact`.`phoneNumber` AS `phoneNumber`,
        `contact`.`landlineContactNumber` AS `landlineContactNumber`,
        `contact`.`addressLine1` AS `addressLine1`,
        `contact`.`addressLine2` AS `addressLine2`,
        `contact`.`addressLine3` AS `addressLine3`,
        `contact`.`localityName` AS `localityName`,
        `contact`.`postcode` AS `postcode`,
        `contact`.`stateTerritoryCode` AS `stateTerritoryCode`,
        `OI`.`orderId` AS `orderId`,
        `OI`.`omId` AS `omId`,
        `OI`.`action` AS `action`,
        `OI`.`itemSubTypeRefId` AS `itemSubTypeRefId`
    FROM
        (
            (
                (
                    `OM_CMN_OrderItem` `OI`
                JOIN `OM_CMN_R_ItemSubTypeRef` `subtype` ON
                    (
                        (
                            `OI`.`itemSubTypeRefId` = `subtype`.`id`
                        )
                    )
                )
            JOIN `OM_CMN_OrderContactLink` `link` ON
                ((`link`.`orderItemId` = `OI`.`id`))
            )
        JOIN `OM_CMN_Contact` `contact` ON
            ((`contact`.`id` = `link`.`contactId`))
        );

    CREATE OR REPLACE VIEW `OM_CMN_NS_ResourceOrder_View` AS(
        SELECT
            `ORD`.`id` AS `orderId`,
            `ORD`.`omId` AS `nbnOrderId`,
            `ORD`.`correlationId` AS `correlationId`,
            `ORD`.`correlationName` AS `correlationName`,
            `ORD`.`statusId` AS `statusId`,
            `ORD`.`orderDate` AS `orderDate`,
            `ORD`.`requestedCompletionDate` AS `requestedCompletionDate`,
            `ORD`.`completionDate` AS `completionDate`,
            `ORD`.`priId` AS `priId`,
            `ORD`.`substatusId` AS `substatusId`,
            `ORD`.`name` AS `name`,
            `ORD`.`npdStatusId` AS `npdStatusId`,
            `ORD`.`orderTypeRefId` AS `orderTypeRefId`,
            `ORD`.`orderType` AS `orderType`,
            `ORD`.`statusVersionId` AS `statusVersionId`,
            `ORD`.`USRN` AS `USRN`,
            `ORD`.`dealId` AS `dealId`,
            `ORD`.`channel` AS `channel`,
            `ORD`.`tranche` AS `tranche`,
            `D`.`RSP` AS `RSP`,
            `ORD`.`nbnURN` AS `nbnURN`,
            `ORD`.`CRMCaseNumber` AS `CRMCaseNumber`,
            `ORD`.`originalSuppliedAddress` AS `originalSuppliedAddress`,
            `ORD`.`sitePriority` AS `sitePriority`,
            `ORD`.`readyToConnectDate` AS `readyToConnectDate`,
            `AP`.`id` AS `applicationId`,
            `AP`.`omId` AS `applicationOmId`,
            `OI`.`mainLineItemFlag` AS `mainLineItemFlag`,
            `OI`.`state` AS `state`,
            `OI`.`id` AS `orderItemId`,
            `OI`.`itemSubTypeRefId` AS `itemSubTypeRefId`,
            `LOC`.`id` AS `locationId`,
            `LOC`.`locId` AS `locId`,
            `LOC`.`locationType` AS `locationType`,
            `LOC`.`longitude` AS `longitude`,
            `LOC`.`latitude` AS `latitude`,
            `LOC`.`samId` AS `samId`,
            `LOC`.`matchType` AS `matchType`,
            `LOC`.`accessTechnologyType` AS `accessTechnologyType`,
            `NS`.`afterHoursSiteVisit` AS `afterHoursSiteVisit`,
            `NS`.`inductionRequired` AS `inductionRequired`,
            `NS`.`securityRequirements` AS `securityRequirements`,
            `NS`.`billingAccountID` AS `billingAccountID`,
            `NS`.`notes` AS `notes`,
            `NS`.`additionalNotes` AS `additionalNotes`,
            `NS`.`tradingName` AS `tradingName`,
            `NS`.`heritageSite` AS `heritageSite`,
            `NS`.`siteName` AS `siteName`,
            `NS`.`ownerAwareOfProposal` AS `ownerAwareOfProposal`,
            `NS`.`siteAccessInstructions` AS `siteAccessInstructions`,
            `NS`.`siteType` AS `siteType`,
            `NS`.`resourceOrderType` AS `resourceOrderType`,
            `NS`.`propertyOwnershipStatus` AS `propertyOwnershipStatus`,
            `NS`.`keysRequired` AS `keysRequired`,
            `NS`.`contractedLocationInstructions` AS `contractedLocationInstructions`,
            `NS`.`orderAcceptedFlag` AS `orderAcceptedFlag`,
            `NS`.`safetyHazards` AS `safetyHazards`,
            `NS`.`jsasswmRequired` AS `jsasswmRequired`,
            `NS`.`workPracticesRequired` AS `workPracticesRequired`,
            `NS`.`workingAtHeightsConsideration` AS `workingAtHeightsConsideration`,
            `NS`.`confinedSpaceRequirements` AS `confinedSpaceRequirements`,
            `NS`.`numberOfServices` AS `numberOfServices`,
            `NS`.`isComplexSite` AS `isComplexSite`,
            `NS`.`internalPCDRequired` AS `internalPCDRequired`,
            `NS`.`siteEquipmentOtherInfo` AS `siteEquipmentOtherInfo`,
            `NS`.`specialRequirementOther` AS `specialRequirementOther`,
            `NS`.`detailedPLASEAssessment` AS `detailedPLASEAssessment`,
            `NPDConstruct`.`transitionExportedDate` AS `userExportedDate`,
            `NPDConstruct`.`transitionReportExportedBy` AS `userExportedBy`,
            `PD`.`decisionFlag` AS `transisitionStartedFlag`,
            `PD`.`updatedOnDTime` AS `transitionUpliftDate`,
            `PDS`.`decisionFlag` AS `transisitionCompletedFlag`
        FROM
            (
                (
                    (
                        (
                            (
                                (
                                    (
                                        (
                                            (
                                                `OM_CMN_Order` `ORD`
                                            LEFT JOIN `OM_CMN_Application` `AP` ON
                                                ((`ORD`.`applicationId` = `AP`.`id`))
                                            )
                                        LEFT JOIN `OM_CMN_Location` `LOC` ON
                                            ((`LOC`.`id` = `ORD`.`locationId`))
                                        )
                                    LEFT JOIN `OM_CMN_Deal` `D` ON
                                        ((`ORD`.`dealId` = `D`.`id`))
                                    )
                                JOIN `OM_CMN_OrderItem` `OI` ON
                                    ((`ORD`.`id` = `OI`.`orderId`))
                                )
                            JOIN `OM_CMN_R_ItemSubTypeRef` `subtype` ON
                                (
                                    (
                                        (
                                            `OI`.`itemSubTypeRefId` = `subtype`.`id`
                                        ) AND(`subtype`.`id` = 6)
                                    )
                                )
                            )
                        JOIN `OM_CMN_NBNSelect` `NS` ON
                            ((`OI`.`entityId` = `NS`.`id`))
                        )
                    LEFT JOIN `OM_CMN_NS_NpdConstructItem_View` `NPDConstruct` ON
                        (
                            (`ORD`.`id` = `NPDConstruct`.`orderId`)
                        )
                    )
                LEFT JOIN `OM_CMN_ProcessDecision` `PD` ON
                    (
                        (
                            (`ORD`.`id` = `PD`.`orderId`) AND(
                                `PD`.`name` = 'transitionToSC3Started'
                            )
                        )
                    )
                )
            LEFT JOIN `OM_CMN_ProcessDecision` `PDS` ON
                (
                    (
                        (`ORD`.`id` = `PDS`.`orderId`) AND(
                            `PDS`.`name` = 'transitionToSC3Completed'
                        )
                    )
                )
            )
        ORDER BY
            `D`.`RSP`
        DESC
    );

    CREATE OR REPLACE VIEW `OM_CMN_NpdConstructItem_View` AS
    SELECT
        `NpdConstruct`.`id` AS `npdConstructId`,
        `NpdConstruct`.`opticalResults` AS `opticalResults`,
        `NpdConstruct`.`submitCompletionFlag` AS `submitCompletionFlag`,
        `NpdConstruct`.`completionsGrantOutcome` AS `completionsGrantOutcome`,
        `NpdConstruct`.`isNetworkBuiltAndNoOutages` AS `isNetworkBuiltAndNoOutages`,
        `NpdConstruct`.`itemSubTypeRefId` AS `itemSubTypeRefId`,
        `OI`.`orderId` AS `orderId`,
        `OI`.`omId` AS `omId`,
        `OI`.`action` AS `action`,
        `OI`.`id` AS `itemId`
    FROM
        (
            (
                `Appian`.`OM_CMN_OrderItem` `OI`
            JOIN `Appian`.`OM_CMN_R_ItemSubTypeRef` `subtype`
            ON
                (
                    (
                        (
                            `OI`.`itemSubTypeRefId` = `subtype`.`id`
                        ) AND(`subtype`.`id` = 11)
                    )
                )
            )
        JOIN `Appian`.`OM_CMN_NPDConstruct` `NpdConstruct`
        ON
            (
                (`NpdConstruct`.`id` = `OI`.`entityId`)
            )
        );

    CREATE OR REPLACE VIEW `OM_CMN_NPDConstruct_View` AS
    SELECT
         `Appian`.`OM_CMN_NPDConstruct`.`id` AS `id`,
         `Appian`.`OM_CMN_NPDConstruct`.`itemId` AS `itemId`,
         `Appian`.`OM_CMN_NPDConstruct`.`opticalResults` AS `opticalResults`,
         `Appian`.`OM_CMN_NPDConstruct`.`isNetworkBuiltAndNoOutages` AS `isNetworkBuiltAndNoOutages`,
         `Appian`.`OM_CMN_NPDConstruct`.`submitCompletionFlag` AS `submitCompletionFlag`,
         `Appian`.`OM_CMN_NPDConstruct`.`completionsGrantOutcome` AS `completionsGrantOutcome`,
         `Appian`.`OM_CMN_NPDConstruct`.`itemSubTypeRefId` AS `itemSubTypeRefId`,
         `Appian`.`OM_CMN_NPDConstruct`.`createdOnDTime` AS `createdOnDTime`,
         `Appian`.`OM_CMN_NPDConstruct`.`updatedOnDTime` AS `updatedOnDTime`
    FROM
         `Appian`.`OM_CMN_NPDConstruct`;
CREATE OR REPLACE VIEW `OM_CMN_OrderLocation_View` AS SELECT
    `ORD`.`id` AS `orderId`,
    `ORD`.`omId` AS `nbnOrderId`,
    `ORD`.`correlationId` AS `correlationId`,
    `ORD`.`correlationName` AS `correlationName`,
    `ORD`.`statusId` AS `statusId`,
    `ORD`.`orderDate` AS `orderDate`,
    `ORD`.`requestedCompletionDate` AS `requestedCompletionDate`,
    `ORD`.`completionDate` AS `completionDate`,
    `ORD`.`priId` AS `priId`,
    `ORD`.`substatusId` AS `substatusId`,
    `ORD`.`npdSubstatusId` AS `npdSubstatusId`,
    `ORD`.`name` AS `name`,
    `ORD`.`deleteFlag` AS `deleteFlag`,
    `ORD`.`itemSubTypeRefId` AS `itemSubTypeRefId`,
    `ORD`.`orderTypeRefId` AS `orderTypeRefId`,
    `ORD`.`expectedCompletionDate` AS `expectedCompletionDate`,
    `ORD`.`custPendFlag` AS `custPendFlag`,
    `ORD`.`USRN` AS `USRN`,
    `deal`.`dealName` AS `dealName`,
    `AP`.`id` AS `applicationId`,
    `AP`.`omId` AS `applicationOmId`,
    `LOC`.`id` AS `locationId`,
    `LOC`.`locId` AS `locId`,
    `LOC`.`samId` AS `samId`,
    `LOC`.`addressFullText` AS `addressFullText`,
    `sec`.`username` AS `securityUsernameOrGroup`,
    `npdPlan`.`stateDeliveryRegion` AS `stateDeliveryRegion`,
    `npdPlan`.`deliveryPartner` AS `deliveryPartner`,
    `NSPlan`.`deliveryPartner` AS `nsDeliveryPartner`,
    `npdDesign`.`mrqId` AS `mrqId`,
    `NSPlan`.`macsMrq` AS `nsMrq`,
    `EE`.`tradingName` AS `tradingName`,
    `NS`.`tradingName` AS `nsTradingName`,
	`LOC`.`state` AS `region`
FROM
    (
        (
            (
                (
                    (
                        (
                            (
                                (
                                    (
                                        (
                                            (
                                                (
                                                    (
                                                        (
                                                            `OM_CMN_Order` `ORD`
                                                        LEFT JOIN `OM_CMN_Location` `LOC` ON
                                                            ((`LOC`.`id` = `ORD`.`locationId`))
                                                        )
                                                    LEFT JOIN `OM_CMN_Application` `AP` ON
                                                        ((`ORD`.`applicationId` = `AP`.`id`))
                                                    )
                                                JOIN `OM_CMN_OrderSecurity` `sec` ON
                                                    ((`sec`.`orderId` = `ORD`.`id`))
                                                )
                                            LEFT JOIN `OM_CMN_OrderItem` `npdPlanOI` ON
                                                (
                                                    (
                                                        (`ORD`.`id` = `npdPlanOI`.`orderId`) AND(`npdPlanOI`.`itemSubTypeRefId` = 8)
                                                    )
                                                )
                                            )
                                        LEFT JOIN `OM_CMN_NPDPlan` `npdPlan` ON
                                            (
                                                (
                                                    `npdPlanOI`.`entityId` = `npdPlan`.`id`
                                                )
                                            )
                                        )
                                    LEFT JOIN `OM_CMN_OrderItem` `npdDesignOI` ON
                                        (
                                            (
                                                (`ORD`.`id` = `npdDesignOI`.`orderId`) AND(
                                                    `npdDesignOI`.`itemSubTypeRefId` = 10
                                                )
                                            )
                                        )
                                    )
                                LEFT JOIN `OM_CMN_NPDDesign` `npdDesign` ON
                                    (
                                        (
                                            `npdDesignOI`.`entityId` = `npdDesign`.`id`
                                        )
                                    )
                                )
                            LEFT JOIN `OM_CMN_OrderItem` `EEOI` ON
                                (
                                    (
                                        (`ORD`.`id` = `EEOI`.`orderId`) AND(`EEOI`.`itemSubTypeRefId` = 1)
                                    )
                                )
                            )
                        LEFT JOIN `OM_CMN_EnterpriseEthernet` `EE` ON
                            ((`EEOI`.`entityId` = `EE`.`id`))
                        )
                    LEFT JOIN `OM_CMN_OrderItem` `NSOI` ON
                        (
                            (
                                (`ORD`.`id` = `NSOI`.`orderId`) AND(`NSOI`.`itemSubTypeRefId` = 6)
                            )
                        )
                    )
                LEFT JOIN `OM_CMN_NBNSelect` `NS` ON
                    ((`NSOI`.`entityId` = `NS`.`id`))
                )
            LEFT JOIN `OM_CMN_OrderItem` `NSPlanOI` ON
                (
                    (
                        (`ORD`.`id` = `NSPlanOI`.`orderId`) AND(`NSPlanOI`.`itemSubTypeRefId` = 12)
                    )
                )
            )
        LEFT JOIN `OM_CMN_NS_NPDPlanDesign` `NSPlan` ON
            (
                (`NSPlanOI`.`entityId` = `NSPlan`.`id`)
            )
        )
    LEFT JOIN `OM_CMN_Deal` `deal` ON
        ((`ORD`.`dealId` = `deal`.`id`))
    );