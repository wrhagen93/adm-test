-- ALters1123467aa

DELIMITER ;
DROP PROCEDURE IF EXISTS alter_OM;
DELIMITER $$
CREATE PROCEDURE alter_OM()
BEGIN 

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Application' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_location_om_cmn_application_fk') THEN
ALTER TABLE `OM_CMN_Application`
  ADD CONSTRAINT `om_cmn_location_om_cmn_application_fk` FOREIGN KEY (`locationId`) REFERENCES `OM_CMN_Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ApplicationItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_application_om_cmn_applicationitem_fk') THEN
ALTER TABLE `OM_CMN_ApplicationItem`
  ADD CONSTRAINT `om_cmn_application_om_cmn_applicationitem_fk` FOREIGN KEY (`applicationId`) REFERENCES `OM_CMN_Application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ApplicationItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_applicationitem_fk') THEN
ALTER TABLE `OM_CMN_ApplicationItem`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_applicationitem_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ApplicationItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_location_om_cmn_applicationitem_fk') THEN
ALTER TABLE `OM_CMN_ApplicationItem`
  ADD CONSTRAINT `om_cmn_location_om_cmn_applicationitem_fk` FOREIGN KEY (`locationId`) REFERENCES `OM_CMN_Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ApplicationItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_itemsubtyperef_om_cmn_applicationitem_fk') THEN
ALTER TABLE `OM_CMN_ApplicationItem`
  ADD CONSTRAINT `om_cmn_r_itemsubtyperef_om_cmn_applicationitem_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_APP_ServiceFeasibilityCosting' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_applicationitem_om_cmn_app_servicefeasibilitycosting_fk') THEN
ALTER TABLE `OM_CMN_APP_ServiceFeasibilityCosting`
  ADD CONSTRAINT `om_cmn_applicationitem_om_cmn_app_servicefeasibilitycosting_fk` FOREIGN KEY (`applicationItemId`) REFERENCES `OM_CMN_ApplicationItem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Attachment' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_attachment_fk') THEN
ALTER TABLE `OM_CMN_Attachment`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_attachment_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Audit' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_audittyperef_om_cmn_audit') THEN
ALTER TABLE `OM_CMN_Audit`
  ADD CONSTRAINT `om_cmn_r_audittyperef_om_cmn_audit` FOREIGN KEY (`auditTypeRefId`) REFERENCES `OM_CMN_R_AuditTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Audit' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_recordtyperef_om_cmn_audit') THEN
ALTER TABLE `OM_CMN_Audit`
  ADD CONSTRAINT `om_cmn_r_recordtyperef_om_cmn_audit` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_BTD' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_btd_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_BTD`
  ADD CONSTRAINT `om_cmn_btd_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_BTD' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_btd_fk') THEN
ALTER TABLE `OM_CMN_BTD`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_btd_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_CNC' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_cnc_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_CNC`
  ADD CONSTRAINT `om_cmn_cnc_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_CNC' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_cnc_fk') THEN
ALTER TABLE `OM_CMN_CNC`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_cnc_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Contact' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_contact_fk') THEN
ALTER TABLE `OM_CMN_Contact`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_contact_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_EnterpriseEthernet' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_enterpriseethernet_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_EnterpriseEthernet`
  ADD CONSTRAINT `om_cmn_enterpriseethernet_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Fibre' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_fibre_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_Fibre`
  ADD CONSTRAINT `om_cmn_fibre_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_FibreJoint' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_applicationitem_om_cmn_fibrejoint_fk') THEN
ALTER TABLE `OM_CMN_FibreJoint`
  ADD CONSTRAINT `om_cmn_applicationitem_om_cmn_fibrejoint_fk` FOREIGN KEY (`itemId`) REFERENCES `OM_CMN_ApplicationItem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_FibreJoint' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_fibrejoint_fk') THEN
ALTER TABLE `OM_CMN_FibreJoint`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_fibrejoint_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_LinkedOrder' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_linkedorder_om_cmn_order_child_fk') THEN
ALTER TABLE `OM_CMN_LinkedOrder`
  ADD CONSTRAINT `om_cmn_linkedorder_om_cmn_order_child_fk` FOREIGN KEY (`childOrderId`) REFERENCES `OM_CMN_Order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_LinkedOrder' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_linkedorder_om_cmn_order_parent_fk') THEN
ALTER TABLE `OM_CMN_LinkedOrder`
  ADD CONSTRAINT `om_cmn_linkedorder_om_cmn_order_parent_fk` FOREIGN KEY (`parentOrderId`) REFERENCES `OM_CMN_Order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Milestone' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_milestone_recordtyperefid_fk') THEN
ALTER TABLE `OM_CMN_Milestone`
  ADD CONSTRAINT `om_cmn_milestone_recordtyperefid_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_NPDConstruct' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_npdconstruct_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_NPDConstruct`
  ADD CONSTRAINT `om_cmn_npdconstruct_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_NPDDesign' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_npddesign_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_NPDDesign`
  ADD CONSTRAINT `om_cmn_npddesign_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_NPDPlan' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_npdplan_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_NPDPlan`
  ADD CONSTRAINT `om_cmn_npdplan_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_accessseekercontact_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_accessseekercontact_om_cmn_order_fk` FOREIGN KEY (`accessSeekerContactId`) REFERENCES `OM_CMN_AccessSeekerContact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_application_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_application_om_cmn_order_fk` FOREIGN KEY (`applicationId`) REFERENCES `OM_CMN_Application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_deal_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_deal_om_cmn_order_fk` FOREIGN KEY (`dealId`) REFERENCES `OM_CMN_Deal` (`id`);
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_location_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_location_om_cmn_order_fk` FOREIGN KEY (`locationId`) REFERENCES `OM_CMN_Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_productheader_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_productheader_om_cmn_order_fk` FOREIGN KEY (`productHeaderId`) REFERENCES `OM_CMN_ProductHeader` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_itemsubtyperef_om_cmn_order') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_itemsubtyperef_om_cmn_order` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_lookupref_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_lookupref_om_cmn_order_fk` FOREIGN KEY (`afterHoursProcessing`) REFERENCES `OM_CMN_R_LookupRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_ordertype_om_cmn_order') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_ordertype_om_cmn_order` FOREIGN KEY (`orderTypeRefId`) REFERENCES `OM_CMN_R_OrderTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_ordertyperef_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_ordertyperef_om_cmn_order_fk` FOREIGN KEY (`orderTypeRefId`) REFERENCES `OM_CMN_R_OrderTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_statusref_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_statusref_om_cmn_order_fk` FOREIGN KEY (`statusId`) REFERENCES `OM_CMN_R_StatusRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_statusversionref_om_cmn_order') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_statusversionref_om_cmn_order` FOREIGN KEY (`statusVersionId`) REFERENCES `OM_CMN_R_StatusVersionRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Order' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_substatusref_om_cmn_order_fk') THEN
ALTER TABLE `OM_CMN_Order`
  ADD CONSTRAINT `om_cmn_r_substatusref_om_cmn_order_fk` FOREIGN KEY (`subStatusId`) REFERENCES `OM_CMN_R_SubstatusRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderContactLink' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_contact_om_cmn_ordercontactlink_fk') THEN
ALTER TABLE `OM_CMN_OrderContactLink`
  ADD CONSTRAINT `om_cmn_contact_om_cmn_ordercontactlink_fk` FOREIGN KEY (`contactId`) REFERENCES `OM_CMN_Contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderContactLink' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_orderitem_om_cmn_ordercontactlink_fk') THEN
ALTER TABLE `OM_CMN_OrderContactLink`
  ADD CONSTRAINT `om_cmn_orderitem_om_cmn_ordercontactlink_fk` FOREIGN KEY (`orderItemId`) REFERENCES `OM_CMN_OrderItem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_entitytype_om_cmn_orderitem_fk') THEN
ALTER TABLE `OM_CMN_OrderItem`
  ADD CONSTRAINT `om_cmn_entitytype_om_cmn_orderitem_fk` FOREIGN KEY (`recordTypeRefId`) REFERENCES `OM_CMN_R_RecordTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_location_om_cmn_orderitem_fk') THEN
ALTER TABLE `OM_CMN_OrderItem`
  ADD CONSTRAINT `om_cmn_location_om_cmn_orderitem_fk` FOREIGN KEY (`locationId`) REFERENCES `OM_CMN_Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_order_om_cmn_orderitem_fk') THEN
ALTER TABLE `OM_CMN_OrderItem`
  ADD CONSTRAINT `om_cmn_order_om_cmn_orderitem_fk` FOREIGN KEY (`orderId`) REFERENCES `OM_CMN_Order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderItem' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_itemsubtyperef_om_cmn_orderitem_fk') THEN
ALTER TABLE `OM_CMN_OrderItem`
  ADD CONSTRAINT `om_cmn_r_itemsubtyperef_om_cmn_orderitem_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OrderSecurity' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_order_om_cmn_ordersecurity_fk') THEN
ALTER TABLE `OM_CMN_OrderSecurity`
  ADD CONSTRAINT `om_cmn_order_om_cmn_ordersecurity_fk` FOREIGN KEY (`orderId`) REFERENCES `OM_CMN_Order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OVC' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_ovc_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_OVC`
  ADD CONSTRAINT `om_cmn_ovc_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_OVC' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_uni_om_cmn_ovc_fk') THEN
ALTER TABLE `OM_CMN_OVC`
  ADD CONSTRAINT `om_cmn_uni_om_cmn_ovc_fk` FOREIGN KEY (`uniId`) REFERENCES `OM_CMN_UNI` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ProcessDecision' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_order_om_cmn_processdecision') THEN
ALTER TABLE `OM_CMN_ProcessDecision`
  ADD CONSTRAINT `om_cmn_order_om_cmn_processdecision` FOREIGN KEY (`orderId`) REFERENCES `OM_CMN_Order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ProcessDecision' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_processdecisionref_om_cmn_processdecision_fk') THEN
ALTER TABLE `OM_CMN_ProcessDecision`
  ADD CONSTRAINT `om_cmn_r_processdecisionref_om_cmn_processdecision_fk` FOREIGN KEY (`processDecisionRefId`) REFERENCES `OM_CMN_R_ProcessDecisionRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_ItemSubTypeRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_itemtyperef_om_cmn_r_itemsubtyperef_fk') THEN
ALTER TABLE `OM_CMN_R_ItemSubTypeRef`
  ADD CONSTRAINT `om_cmn_r_itemtyperef_om_cmn_r_itemsubtyperef_fk` FOREIGN KEY (`itemTypeRefId`) REFERENCES `OM_CMN_R_ItemTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_ProcessDecisionRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_processdecisionref_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_R_ProcessDecisionRef`
  ADD CONSTRAINT `om_cmn_r_processdecisionref_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_StatusVersionLinkRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_statusversionref_om_cmn_r_statustemplateref_fk') THEN
ALTER TABLE `OM_CMN_R_StatusVersionLinkRef`
  ADD CONSTRAINT `om_cmn_r_statusversionref_om_cmn_r_statustemplateref_fk` FOREIGN KEY (`statusVersionRefId`) REFERENCES `OM_CMN_R_StatusVersionRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_StatusVersionLinkRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_substatusref_om_cmn_r_statustemplateref_fk') THEN
ALTER TABLE `OM_CMN_R_StatusVersionLinkRef`
  ADD CONSTRAINT `om_cmn_r_substatusref_om_cmn_r_statustemplateref_fk` FOREIGN KEY (`substatusRefId`) REFERENCES `OM_CMN_R_SubstatusRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_StatusVersionRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_statusversionref_om_cmn_r_itemsubtyperef') THEN
ALTER TABLE `OM_CMN_R_StatusVersionRef`
  ADD CONSTRAINT `om_cmn_r_statusversionref_om_cmn_r_itemsubtyperef` FOREIGN KEY (`productId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_StatusVersionRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_statusversionref_om_cmn_r_ordertyperef') THEN
ALTER TABLE `OM_CMN_R_StatusVersionRef`
  ADD CONSTRAINT `om_cmn_r_statusversionref_om_cmn_r_ordertyperef` FOREIGN KEY (`orderTypeRefId`) REFERENCES `OM_CMN_R_OrderTypeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_R_SubstatusRef' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_statusref_om_cmn_r_substatusref_fk') THEN
ALTER TABLE `OM_CMN_R_SubstatusRef`
  ADD CONSTRAINT `om_cmn_r_statusref_om_cmn_r_substatusref_fk` FOREIGN KEY (`statusRefId`) REFERENCES `OM_CMN_R_StatusRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_ServiceLog' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_r_servicetyperef_om_cmn_servicelog_fk') THEN
ALTER TABLE `OM_CMN_ServiceLog`
  ADD CONSTRAINT `om_cmn_r_servicetyperef_om_cmn_servicelog_fk` FOREIGN KEY (`serviceTypeId`) REFERENCES `OM_CMN_R_ServiceType` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Site' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_cnc_om_cmn_site_fk') THEN
ALTER TABLE `OM_CMN_Site`
  ADD CONSTRAINT `om_cmn_cnc_om_cmn_site_fk` FOREIGN KEY (`cncId`) REFERENCES `OM_CMN_CNC` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_Tunnel' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_site_om_cmn_tunnel_fk') THEN
ALTER TABLE `OM_CMN_Tunnel`
  ADD CONSTRAINT `om_cmn_site_om_cmn_tunnel_fk` FOREIGN KEY (`siteId`) REFERENCES `OM_CMN_Site` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;



IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_UNI' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_btd_om_cmn_uni_fk') THEN
ALTER TABLE `OM_CMN_UNI`
  ADD CONSTRAINT `om_cmn_btd_om_cmn_uni_fk` FOREIGN KEY (`btdId`) REFERENCES `OM_CMN_BTD` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;

IF NOT EXISTS (SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = 'OM_CMN_UNI' AND table_schema = 'Appian' AND constraint_name = 'om_cmn_uni_om_cmn_itemsubtyperefid_fk') THEN
ALTER TABLE `OM_CMN_UNI`
  ADD CONSTRAINT `om_cmn_uni_om_cmn_itemsubtyperefid_fk` FOREIGN KEY (`itemSubTypeRefId`) REFERENCES `OM_CMN_R_ItemSubTypeRef` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
END IF;

-- 1906 EE 

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_Order")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_Order' and Column_Name = 'custPendFlag') THEN
ALTER TABLE `OM_CMN_Order` ADD COLUMN `custPendFlag` tinyint(1) DEFAULT NULL COMMENT '	used when a nbn internal user pends the order to track all customer caused delays';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_Order")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_Order' and Column_Name = 'afterHoursProcessing') THEN
ALTER TABLE `OM_CMN_Order` ADD COLUMN `afterHoursProcessing` INT NULL DEFAULT NULL;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_Order")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_Order' and Column_Name = 'afterHoursProcessing') THEN
ALTER TABLE `OM_CMN_STG_Order` ADD `afterHoursProcessing` INT NULL DEFAULT NULL;
END IF;

IF EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_PendHold")
AND
 EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_R_ReasonCodeRef")
AND
 NOT EXISTS (select * from information_schema.table_constraints where table_name = "OM_CMN_PendHold" and constraint_name = "om_cmn_r_reasoncoderef_om_cmn_pendhold_fk") THEN
ALTER TABLE `OM_CMN_PendHold`
  ADD CONSTRAINT `om_cmn_r_reasoncoderef_om_cmn_pendhold_fk` FOREIGN KEY (`reasonCodeRefId`) REFERENCES `OM_CMN_R_ReasonCodeRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_Order")
AND
 EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_R_LookupRef")
AND
 NOT EXISTS (select * from information_schema.table_constraints where table_name = "OM_CMN_Order" and constraint_name = "om_cmn_r_lookupref_om_cmn_order_fk") THEN

ALTER TABLE `OM_CMN_Order` ADD CONSTRAINT `om_cmn_r_lookupref_om_cmn_order_fk` FOREIGN KEY (`afterHoursProcessing`) REFERENCES `OM_CMN_R_LookupRef`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_R_ReasonCodeRef")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_R_ReasonCodeRef' and Column_Name = 'typeRefId') THEN
ALTER TABLE `OM_CMN_R_ReasonCodeRef` ADD COLUMN `typeRefId` int(11) NOT NULL ;
END IF;


IF EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_R_ReasonCodeRef")
AND
 EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_R_LookupRef")
AND
 NOT EXISTS (select * from information_schema.table_constraints where table_name = "OM_CMN_R_ReasonCodeRef" and constraint_name = "om_cmn_r_reasonCodeRef_om_cmn_r_lookupRef_fk") THEN
ALTER TABLE `OM_CMN_R_ReasonCodeRef`
  ADD CONSTRAINT `om_cmn_r_reasonCodeRef_om_cmn_r_lookupRef_fk` FOREIGN KEY (`typeRefId`) REFERENCES `OM_CMN_R_LookupRef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
END IF;

ALTER TABLE `OM_CMN_Order` CHANGE `custPendFlag` `custPendFlag` TINYINT(1) NULL DEFAULT '0' COMMENT 'used when a nbn internal user pends the order to track all customer caused delays';

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_R_ReasonCodeRef")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_R_ReasonCodeRef' and Column_Name = 'resumeReasonCodeRefId') THEN
ALTER TABLE `OM_CMN_R_ReasonCodeRef` ADD COLUMN `resumeReasonCodeRefId` int(11) DEFAULT NULL after typeRefId;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_Order")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_Order' and Column_Name = 'accessSeekerName') THEN
ALTER TABLE `OM_CMN_Order` ADD COLUMN `accessSeekerName` varchar(255) DEFAULT NULL COMMENT 'Network Access Seeker Name';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_OVC")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_OVC' and Column_Name = 'nasId') THEN
ALTER TABLE `OM_CMN_OVC` ADD COLUMN `nasId` varchar(255) DEFAULT NULL COMMENT 'Network Access Seeker Id';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_OVC")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_OVC' and Column_Name = 'subscriberId') THEN
ALTER TABLE `OM_CMN_OVC` ADD COLUMN `subscriberId` varchar(255) DEFAULT NULL COMMENT 'SAM customer Id';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_OVC")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_OVC' and Column_Name = 'inniSVLanId') THEN
ALTER TABLE `OM_CMN_OVC` ADD COLUMN `inniSVLanId` varchar(255) DEFAULT NULL COMMENT 'Internal network to network interface svlanid';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_OVC")
AND
	EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_OVC' and Column_Name = 'sVLanId') THEN
ALTER TABLE `OM_CMN_OVC` CHANGE `sVLanId` `sVLanId` VARCHAR(255) NULL DEFAULT NULL COMMENT 'External network to network interface svlanid';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_Order")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_Order' and Column_Name = 'accessSeekerName') THEN
ALTER TABLE `OM_CMN_STG_Order` ADD COLUMN `accessSeekerName` varchar(255) DEFAULT NULL COMMENT 'Network Access Seeker Name';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_OVC")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_OVC' and Column_Name = 'nasId') THEN
ALTER TABLE `OM_CMN_STG_OVC` ADD COLUMN `nasId` varchar(255) DEFAULT NULL COMMENT 'Network Access Seeker Id';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_OVC")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_OVC' and Column_Name = 'subscriberId') THEN
ALTER TABLE `OM_CMN_STG_OVC` ADD COLUMN `subscriberId` varchar(255) DEFAULT NULL COMMENT 'SAM customer Id';
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_OVC")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_OVC' and Column_Name = 'inniSVLanId') THEN
ALTER TABLE `OM_CMN_STG_OVC` ADD COLUMN `inniSVLanId` varchar(255) DEFAULT NULL COMMENT 'Internal network to network interface svlanid';
END IF;



-- 1906 NPD 
IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_NPDDesign")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_NPDDesign' and Column_Name = 'designOutcome') THEN
ALTER TABLE `OM_CMN_NPDDesign` ADD COLUMN `designOutcome` VARCHAR(255) NULL COMMENT 'Design review outcome';
END IF;
IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_NPDDesign")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_NPDDesign' and Column_Name = 'purchaseOrderId') THEN
ALTER TABLE `OM_CMN_NPDDesign` ADD COLUMN `purchaseOrderId` VARCHAR(255) NULL COMMENT 'Purchase order Id (POR)';
END IF;


IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_NPDDesign")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_NPDDesign' and Column_Name = 'workReleaseId') THEN
ALTER TABLE `OM_CMN_NPDDesign` ADD COLUMN `workReleaseId` VARCHAR(255) NULL COMMENT 'Work release Id(WOR)';
END IF;


IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_NPDDesign")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_NPDDesign' and Column_Name = 'designVersionNumber') THEN
ALTER TABLE `OM_CMN_NPDDesign` ADD COLUMN `designVersionNumber` VARCHAR(255) NULL;
END IF;


IF EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_NPDDesign")
   AND
   NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_NPDDesign' and Column_Name = 'bomboqVersionNumber') THEN
ALTER TABLE `OM_CMN_NPDDesign` ADD COLUMN `bomboqVersionNumber` VARCHAR(255) NULL;
END IF;

IF EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_BSSite")
   AND
   EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_BSSite' and Column_Name = 'street') THEN
ALTER TABLE `OM_CMN_STG_BSSite` CHANGE COLUMN `street` `streetOrLotNumber` VARCHAR(255) DEFAULT NULL;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_BSSite")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_BSSite' and Column_Name = 'siteContactLandline') THEN
ALTER TABLE `OM_CMN_STG_BSSite` ADD COLUMN `siteContactLandline` TEXT DEFAULT NULL AFTER `siteContactContactNumber`;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_BSSite")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_BSSite' and Column_Name = 'secondarySiteContactLandline') THEN
ALTER TABLE `OM_CMN_STG_BSSite` ADD COLUMN `secondarySiteContactLandline` TEXT DEFAULT NULL AFTER `secondarySiteContactContactNumber`;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_STG_BSSite")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_STG_BSSite' and Column_Name = 'matchType') THEN
ALTER TABLE `OM_CMN_STG_BSSite` ADD COLUMN `matchType` TEXT DEFAULT NULL AFTER `locId`;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_Location")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_Location' and Column_Name = 'matchType') THEN
ALTER TABLE `OM_CMN_Location` ADD COLUMN `matchType` VARCHAR(255) DEFAULT NULL AFTER `locality`;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_Contact")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_Contact' and Column_Name = 'landlineContactNumber') THEN
ALTER TABLE `OM_CMN_Contact` ADD COLUMN `landlineContactNumber` VARCHAR(255) DEFAULT NULL AFTER `phoneNumber`;
END IF;

IF
	EXISTS (select * from information_schema.COLUMNS where table_name = "OM_CMN_NPDConstruct")
AND
	NOT EXISTS (SELECT * from INFORMATION_SCHEMA.COLUMNS where Table_Name = 'OM_CMN_NPDConstruct' and Column_Name = 'completionsGrantOutcome') THEN
ALTER TABLE `OM_CMN_NPDConstruct` ADD `completionsGrantOutcome` VARCHAR(255) NULL COMMENT 'Outcome of Practical Completions grant';
END IF;

ALTER TABLE `OM_CMN_STG_Order` CHANGE `orderDate` `orderDate` DATETIME NULL DEFAULT NULL;
ALTER TABLE `OM_CMN_STG_Order` CHANGE `orderTypeRefId` `orderTypeRefId` INT(11) NULL DEFAULT NULL;


END$$
DELIMITER ;
CALL alter_OM();