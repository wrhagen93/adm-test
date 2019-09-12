
-- Functions, Procs and Triggers133567558
-- TRIGGERS --
SET FOREIGN_KEY_CHECKS = 0;
DROP TRIGGER IF EXISTS `TRG_OM_CMN_Application`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_Application` BEFORE UPDATE ON `OM_CMN_Application` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_ApplicationItem`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_ApplicationItem` BEFORE UPDATE ON `OM_CMN_ApplicationItem` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_APP_ServiceFeasibilityCosting`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_APP_ServiceFeasibilityCosting` BEFORE UPDATE ON `OM_CMN_APP_ServiceFeasibilityCosting` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_EnterpriseEthernet`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_EnterpriseEthernet` BEFORE UPDATE ON `OM_CMN_EnterpriseEthernet` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_Fibre`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_Fibre` AFTER INSERT ON `OM_CMN_Fibre` FOR EACH ROW BEGIN
		  INSERT INTO
			OM_CMN_OrderItem
		(
			`orderId`, entityId, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, hideSummaryRowFlag, updatedOnDTime ,	idx, mainLineItemFlag
		)
		SELECT
			item.`orderId`, NEW.id, subtype.id, o.`locationId`, item.recordTypeRefId, `parentOrderItemId`, o.`omId`, true, CURRENT_TIMESTAMP,0,0
		FROM
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_R_ItemSubTypeRef subtype
		ON
			subtype.name = 'NPD Fibre'
		INNER JOIN
			OM_CMN_Order o
		ON
			o.id = item.orderId
		WHERE
			item.id = NEW.itemId;
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_FibreJoint`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_FibreJoint` BEFORE UPDATE ON `OM_CMN_FibreJoint` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_Location`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_Location` BEFORE UPDATE ON `OM_CMN_Location` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NBNSelect`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NBNSelect` AFTER INSERT ON `OM_CMN_NBNSelect` FOR EACH ROW BEGIN
                DECLARE DEAL_ID INT;
				IF NEW.itemId IS NOT NULL THEN
                SELECT dealId INTO DEAL_ID FROM OM_CMN_Order WHERE id=(SELECT orderId FROM OM_CMN_OrderItem WHERE id=NEW.itemId);
				END IF;
                                  IF DEAL_ID IS NOT NULL AND DEAL_ID<>'' THEN
                                  UPDATE OM_CMN_OrderItem SET entityId=NEW.id WHERE id=NEW.itemId;
          END IF;



END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NPDConstruct`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NPDConstruct` AFTER INSERT ON `OM_CMN_NPDConstruct` FOR EACH ROW BEGIN
		 INSERT INTO
			OM_CMN_OrderItem
		(
			`orderId`, entityId, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, hideSummaryRowFlag, updatedOnDTime,idx, mainLineItemFlag
		)
		SELECT
			item.`orderId`, NEW.id, subtype.id, o.`locationId`, item.recordTypeRefId, `parentOrderItemId`, o.`omId`, true, CURRENT_TIMESTAMP,0,0
		FROM
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_R_ItemSubTypeRef subtype
		ON
			subtype.name = 'NPD Construct'
		INNER JOIN
			OM_CMN_Order o
		ON
			o.id = item.orderId
		WHERE
			item.id = NEW.itemId;
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NPDDesign`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NPDDesign` AFTER INSERT ON `OM_CMN_NPDDesign` FOR EACH ROW BEGIN
		INSERT INTO
			OM_CMN_OrderItem
		(
			`orderId`, entityId, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, hideSummaryRowFlag, updatedOnDTime,idx, mainLineItemFlag
		)
		SELECT
			item.`orderId`, NEW.id, subtype.id, o.`locationId`, item.recordTypeRefId, `parentOrderItemId`, o.`omId`, true, CURRENT_TIMESTAMP,0,0
		FROM
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_R_ItemSubTypeRef subtype
		ON
			subtype.name = 'NPD Design'
		INNER JOIN
			OM_CMN_Order o
		ON
			o.id = item.orderId
		WHERE
			item.id = NEW.itemId;
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NPDPlan`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NPDPlan` AFTER INSERT ON `OM_CMN_NPDPlan` FOR EACH ROW BEGIN
		  INSERT INTO
			OM_CMN_OrderItem
		(
			`orderId`, entityId, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, hideSummaryRowFlag, updatedOnDTime,idx, mainLineItemFlag
		)
		SELECT
			item.`orderId`, NEW.id, subtype.id, o.`locationId`, item.recordTypeRefId, `parentOrderItemId`, o.`omId`, true, CURRENT_TIMESTAMP,0,0
		FROM
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_R_ItemSubTypeRef subtype
		ON
			subtype.name = 'NPD Plan'
		INNER JOIN
			OM_CMN_Order o
		ON
			o.id = item.orderId
		WHERE
			item.id = NEW.itemId;
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NS_NPDConstruct`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NS_NPDConstruct` AFTER INSERT ON `OM_CMN_NS_NPDConstruct` FOR EACH ROW BEGIN
		  INSERT INTO
			OM_CMN_OrderItem
		(
			`orderId`, entityId, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, hideSummaryRowFlag, updatedOnDTime,idx, mainLineItemFlag
		)
		SELECT
			item.`orderId`, NEW.id, subtype.id, o.`locationId`, item.recordTypeRefId, `parentOrderItemId`, o.`omId`, true, CURRENT_TIMESTAMP,0,0
		FROM
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_R_ItemSubTypeRef subtype
		ON
			subtype.name = 'NS NPD Construction'
		INNER JOIN
			OM_CMN_Order o
		ON
			o.id = item.orderId
		WHERE
			item.id = NEW.itemId;
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NPDPlanDesign`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NPDPlanDesign` AFTER INSERT ON `OM_CMN_NS_NPDPlanDesign` FOR EACH ROW BEGIN

IF EXISTS (SELECT id FROM OM_CMN_OrderItem WHERE id=NEW.itemId AND itemSubTypeRefId=12) THEN UPDATE OM_CMN_OrderItem SET entityId=NEW.id WHERE id=NEW.itemId; ELSE
		  INSERT INTO
			OM_CMN_OrderItem
		(
			`orderId`, entityId, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, hideSummaryRowFlag, updatedOnDTime,idx, mainLineItemFlag
		)
		SELECT
			item.`orderId`, NEW.id, subtype.id, o.`locationId`, item.recordTypeRefId, `parentOrderItemId`, o.`omId`, true, CURRENT_TIMESTAMP,0,0
		FROM
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_R_ItemSubTypeRef subtype
		ON
			subtype.name = 'NS NPD Plan & Design'
		INNER JOIN
			OM_CMN_Order o
		ON
			o.id = item.orderId
		WHERE
			item.id = NEW.itemId;

            END IF;
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_NTD`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_NTD` AFTER INSERT ON `OM_CMN_NTD` FOR EACH ROW BEGIN
                DECLARE DEAL_ID INT;
				IF NEW.itemId IS NOT NULL THEN
                SELECT dealId INTO DEAL_ID FROM OM_CMN_Order WHERE id=(SELECT orderId FROM OM_CMN_OrderItem WHERE id=NEW.itemId);
				END IF;
                                  IF DEAL_ID IS NOT NULL AND DEAL_ID<>'' THEN
                                  UPDATE OM_CMN_OrderItem SET entityId=NEW.id WHERE id=NEW.itemId;
          END IF;



END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_Order`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_Order` BEFORE UPDATE ON `OM_CMN_Order` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_Order_Security`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_Order_Security` AFTER INSERT ON `OM_CMN_Order` FOR EACH ROW BEGIN

		INSERT INTO
			OM_CMN_OrderSecurity (orderId, username)
		SELECT
			NEW.id,
			l.value
		FROM
			OM_CMN_R_LookupRef l
		WHERE
			l.category = 'Internal Group'
		AND
			l.label = 'OM CMN Internal User';
	END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_OrderItem`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_OrderItem` BEFORE UPDATE ON `OM_CMN_OrderItem` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_ProcessDecision`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_ProcessDecision` BEFORE UPDATE ON `OM_CMN_ProcessDecision` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_ProductHeader`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_ProductHeader` BEFORE UPDATE ON `OM_CMN_ProductHeader` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_R_ItemTypeRef`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_R_ItemTypeRef` BEFORE UPDATE ON `OM_CMN_R_ItemTypeRef` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_R_OrderTypeRef`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_R_OrderTypeRef` BEFORE UPDATE ON `OM_CMN_R_OrderTypeRef` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_R_RecordTypeRef`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_R_RecordTypeRef` BEFORE UPDATE ON `OM_CMN_R_RecordTypeRef` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_R_StatusRef`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_R_StatusRef` BEFORE UPDATE ON `OM_CMN_R_StatusRef` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


DROP TRIGGER IF EXISTS `TRG_OM_CMN_R_SubstatusRef`;


DELIMITER $$
CREATE TRIGGER `TRG_OM_CMN_R_SubstatusRef` BEFORE UPDATE ON `OM_CMN_R_SubstatusRef` FOR EACH ROW BEGIN
        SET NEW.updatedOnDTime = NOW();
    END
$$
DELIMITER ;


-- FUNCTIONS --
DROP FUNCTION IF EXISTS OM_CMN_FUNC_CeilDecimalToInt;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_CeilDecimalToInt`(`p_decimalValue` DECIMAL(13,2) ) RETURNS int(11)
    NO SQL
BEGIN
   RETURN CEILING( p_decimalValue );
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_ConcatenateString;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_ConcatenateString`(`p_oldString` VARCHAR(255) CHARSET utf8, `p_newString` VARCHAR(255) CHARSET utf8) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
        IF(p_newString IS NOT NULL AND p_newString != '' ) THEN IF(p_oldString IS NOT NULL AND p_oldString != '' ) THEN RETURN concat(p_oldString,"||",p_newString) ; ELSE RETURN p_newString ;
    END IF ; ELSE RETURN p_oldString ;
END IF ;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_ConvertStringToDate;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_ConvertStringToDate`(`dataToConvert` VARCHAR(255)) RETURNS date
    NO SQL
BEGIN
    RETURN
	CASE WHEN (`dataToConvert` IS NULL OR `dataToConvert`='' OR `dataToConvert`=' ') THEN
	NULL
	ELSE
		CASE WHEN `dataToConvert` REGEXP '^((0[1-9]|[12][0-9]|3[01])[-/](0[1-9]|1[0-2])[-/][12][0-9]{3})$'
		THEN
			CASE WHEN `dataToConvert` REGEXP '^((0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[12][0-9]{3})$'
			THEN
			STR_TO_DATE(`dataToConvert`, '%d-%m-%Y')
			ELSE
				CASE WHEN `dataToConvert` REGEXP '^((0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[12][0-9]{3})$'
				THEN
				STR_TO_DATE(`dataToConvert`, '%d/%m/%Y')
				ELSE
				NULL END
			END
		ELSE NULL
		END
	END;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_GetFinanceCode;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_GetFinanceCode`(`stateTxt` VARCHAR(255), `dealId` INT) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
DECLARE financeCode VARCHAR(255);
SELECT DISTINCT
    PLANDESIGN.financeCode INTO financeCode
FROM
    OM_CMN_Order ORD,
    OM_CMN_Location LOC,
    OM_CMN_OrderItem ITE,
    OM_CMN_NS_NPDPlanDesign PLANDESIGN
WHERE
    ORD.dealId = dealId AND LOC.id = ORD.locationId AND LOC.state = stateTxt AND ITE.orderId = ORD.id AND ITE.itemSubTypeRefId = 12 AND PLANDESIGN.id = ITE.entityId AND(
        PLANDESIGN.financeCode IS NOT NULL OR PLANDESIGN.financeCode <> ''
    );
	RETURN financeCode;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_GetLatestStatusVersionId;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_GetLatestStatusVersionId`(
	p_productId INT,
	p_mpoOrderType VARCHAR(255),
	p_orderTypeRefId INT,
	p_shortfallType VARCHAR(255)
) RETURNS int(11)
BEGIN
	DECLARE returnId INT;

	SET returnId =
		(SELECT
			id
		FROM
			OM_CMN_R_StatusVersionRef
		WHERE
			productId = p_productId
		AND
			mpoOrderType = p_mpoOrderType
		AND
			orderTypeRefId = p_orderTypeRefId
		AND
			shortfallType = p_shortfallType
		AND
			isActiveFlag = 1
		AND
			versionNo = (
				SELECT
					MAX(versionNo)
				FROM
					OM_CMN_R_StatusVersionRef
				WHERE
					productId = p_productId
				AND
					mpoOrderType = p_mpoOrderType
				AND
					orderTypeRefId = p_orderTypeRefId
				AND
					shortfallType = p_shortfallType
				AND
					isActiveFlag = 1
			));

	RETURN returnId;

   END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_GetOrderSubType;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_GetOrderSubType`(`p_orderId` INT, `p_orderType` VARCHAR(50)) RETURNS varchar(50) CHARSET utf8
BEGIN

	IF p_orderId IS NULL OR p_orderType IS NULL THEN
		RETURN NULL;
	ELSEIF p_orderType = 'Connect' THEN
		RETURN NULL;
	ELSEIF p_orderType = 'Modify' THEN
		RETURN (
			select DISTINCT itemTypeRef.name from
				OM_CMN_OrderItem OI
				JOIN OM_CMN_R_ItemSubTypeRef itemSubRef
					ON (OI.itemSubTypeRefId = itemSubRef.id)
				JOIN OM_CMN_R_ItemTypeRef itemTypeRef
					ON (itemSubRef.itemTypeRefId = itemTypeRef.id)
				where action <> 'NO CHANGE' and orderId = p_orderId
			);
	ELSE RETURN NULL;
	END IF;

  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_InsertDeal;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_InsertDeal`(`p_stagingSiteId` INT, `p_createdBy` VARCHAR(255)) RETURNS int(11)
BEGIN

DECLARE p_dealId INT(11);

SELECT
	D.`id` INTO p_dealId
	FROM
		`OM_CMN_Deal` D JOIN  `OM_CMN_STG_BSSite` S
			ON
			(
				D.`dealName` = S.`dealName` and D.`RSP` = S.`RSP` and D.`customer` = S.`tradingName`
			)
	WHERE
		S.`id` = p_stagingSiteId;

IF p_dealId  IS NULL

	THEN

		INSERT INTO
			`OM_CMN_Deal`
			(
				`dealName`, `createdOnDTime`, `createdBy`,`RSP`,`customer`
			)
			SELECT
				`dealName`, NOW(), p_createdBy,`RSP`,`tradingName`
			FROM
				`OM_CMN_STG_BSSite`
			WHERE
				id = p_stagingSiteId;

		SELECT LAST_INSERT_ID() INTO p_dealId;
		UPDATE OM_CMN_Deal SET `dealIdentifier` = concat('DL',RIGHT(concat('000000000',p_dealId),9)) where `id` = p_dealId;

END IF;

RETURN p_dealId;

END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FUNC_ReturnInt;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FUNC_ReturnInt`(`p_intVal` INT UNSIGNED) RETURNS int(11)
    NO SQL
BEGIN
   RETURN IF(p_intVal IS NULL, 0,p_intVal) ;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FormatDateTime;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FormatDateTime`(`p_dateTime` DATETIME, `p_dateOnlyFlag` BOOLEAN) RETURNS varchar(24) CHARSET utf8
BEGIN

	IF (p_dateOnlyFlag IS NULL) THEN
		RETURN NULL;
	ELSEIF p_dateOnlyFlag THEN
    	RETURN
			CONCAT(YEAR(p_dateTime),"-",LPAD(MONTH(p_dateTime),2,'0'),"-",LPAD(DAY(p_dateTime),2,'0'));
	ELSE
		RETURN
			CONCAT(
					YEAR(p_dateTime),"-",LPAD(MONTH(p_dateTime),2,'0'),"-",LPAD(DAY(p_dateTime),2,'0'),"T",LPAD(HOUR(p_dateTime),2,'0'),":",
					LPAD(MINUTE(p_dateTime),2,'0'),":",LPAD(SECOND(p_dateTime),2,'0'),"Z");
	END IF;

  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_FormatDateTimeForJson;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_FormatDateTimeForJson`(`p_dateTime` DATETIME, `p_dateOnlyFlag` BOOLEAN) RETURNS varchar(24) CHARSET utf8
BEGIN

	IF (p_dateOnlyFlag IS NULL) THEN
		RETURN NULL;
	ELSEIF p_dateOnlyFlag THEN
    	RETURN
			CONCAT(LPAD(DAY(p_dateTime),2,'0'),"/",LPAD(MONTH(p_dateTime),2,'0'),"/",YEAR(p_dateTime));
	ELSE
		RETURN

			CONCAT(LPAD(DAY(p_dateTime),2,'0'),"/",LPAD(MONTH(p_dateTime),2,'0'),"/",YEAR(p_dateTime)," ",
					LPAD(HOUR(p_dateTime),2,'0'),":",LPAD(MINUTE(p_dateTime),2,'0'),":",LPAD(SECOND(p_dateTime),2,'0'));
	END IF;

  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_JSON_SCT_ItemInvolvesContact;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_JSON_SCT_ItemInvolvesContact`(
	p_itemId INT
) RETURNS json
BEGIN

  DECLARE itemInvolvesContact JSON;

  SET SESSION group_concat_max_len = 1000000;

  SET
	itemInvolvesContact =
	(
		SELECT
			REPLACE(
			REPLACE(
			REPLACE(
			JSON_ARRAY(
				GROUP_CONCAT(
					JSON_MERGE(
						JSON_OBJECT('type',c.type),
						JSON_OBJECT('contactName',c.contactName),
						JSON_OBJECT('role',c.role),
						JSON_OBJECT('emailAddress',c.emailAddress),
						JSON_OBJECT('phoneNumber',c.phoneNumber),
						JSON_OBJECT('unstructuredAddress',
							JSON_MERGE(
								JSON_OBJECT('addressLine1',c.addressLine1),
								JSON_OBJECT('addressLine2',c.addressLine2),
								JSON_OBJECT('addressLine3',c.addressLine3),
								JSON_OBJECT('localityName',c.localityName),
								JSON_OBJECT('postcode',c.postcode),
								JSON_OBJECT('stateTerritoryCode',c.stateTerritoryCode)
							)
						)
					)
				)
			)
			,'\\"','"')
			,'[\"','[')
			,'\"]',']')
		FROM
			OM_CMN_Contact c
		INNER JOIN
			OM_CMN_OrderContactLink link
		ON
			link.contactId = c.id
		AND
			orderItemId = p_itemId
	);

	RETURN itemInvolvesContact;

  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_JSON_SCT_NotifyOrderNote;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_JSON_SCT_NotifyOrderNote`(`p_noteId` VARCHAR(255), `p_reasonCode` BOOLEAN) RETURNS json
BEGIN

  DECLARE note JSON;

  SET
	note =
	(
		SELECT
		CASE WHEN p_reasonCode THEN
			JSON_OBJECT(
				'reasonCode',note.category,
				'reasonDescription',note.value
				)
		ELSE
			JSON_OBJECT(
				'id',note.category,
				'description',note.value
				)
		END
		FROM
			OM_CMN_R_LookupRef note
		WHERE
			note.category = p_noteId
		AND
			note.label = 'description'
	);

	RETURN note;

  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_ParseJsonField;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_ParseJsonField`(
	p_value VARCHAR(15000)
) RETURNS varchar(15000) CHARSET utf8
BEGIN

	IF p_value = 'null' THEN
		RETURN NULL;
	ELSE
		RETURN p_value;
	END IF;

  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_SplitStr;
DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_SplitStr`(
  val VARCHAR(4000),
  delimit VARCHAR(12),
  posit INT
) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(val, delimit, posit),
       LENGTH(SUBSTRING_INDEX(val, delimit, posit -1)) + 1),
       delimit, '');
END$$
DELIMITER ;


-- STORED PROCEDURES --

DROP PROCEDURE IF EXISTS OM_CMN_GetServiceLog;

DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_GetServiceLog`(IN `p_requestId` VARCHAR(255), OUT `p_processName` VARCHAR(255), OUT `p_json` JSON,OUT `p_serviceTypeId` INT)
BEGIN

	SELECT processName INTO p_processName FROM OM_CMN_ServiceLog  WHERE requestId = p_requestId order by createdOn asc limit 1;
	SELECT requestJson INTO p_json 	FROM OM_CMN_ServiceLog  WHERE requestId = p_requestId order by createdOn asc limit 1;
	SELECT serviceTypeId INTO p_serviceTypeId 	FROM OM_CMN_ServiceLog  WHERE requestId = p_requestId order by createdOn asc limit 1;

  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_AddDeliveryPartnerOrderSecurity;
DELIMITER $$
CREATE PROCEDURE `OM_CMN_SP_AddDeliveryPartnerOrderSecurity`(IN `p_orderId` INT, IN `p_deliveryPartner` VARCHAR(255))
BEGIN

	INSERT INTO
		OM_CMN_OrderSecurity
	(orderId, username)
	SELECT
		p_orderId,
		l.value

	FROM
		OM_CMN_R_LookupRef l
	LEFT JOIN
		OM_CMN_OrderSecurity sec
	ON
		sec.orderId = p_orderId
	AND
		sec.username = l.value
	WHERE
		l.category = 'DP Group'
	AND
		l.label = p_deliveryPartner
	AND
		sec.id IS NULL;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_DeleteStagingBSSites;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_DeleteStagingBSSites`(IN `p_processId` INT, IN `p_isCommenced` TINYINT(1), OUT `p_procStatus` VARCHAR(50), IN `p_isCalledFromNotificationProcess` TINYINT(1))
BEGIN
IF p_processId > 0
THEN
CASE WHEN p_isCalledFromNotificationProcess = 1 THEN
DELETE FROM OM_CMN_STG_BSSite WHERE processId=p_processId AND `OmID` LIKE '%ROR%';
DELETE FROM OM_CMN_STG_BSSite WHERE processId=P_processId AND (isCommenced = 0 OR isCommenced IS NULL);
WHEN p_isCommenced = 0  THEN 
DELETE FROM OM_CMN_STG_BSSite WHERE processId=p_processId AND isCommenced IS NULL;
WHEN p_isCommenced = 0 OR p_isCommenced = 1 THEN
DELETE FROM OM_CMN_STG_BSSite WHERE processId=p_processId AND isCommenced = p_isCommenced;
ELSE
DELETE FROM OM_CMN_STG_BSSite WHERE processId=p_processId;
END CASE;
END IF;
SET
    p_procStatus = "SUCCESS";
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_ExportCommercialFinance;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_ExportCommercialFinance`(
  IN p_processId INT,
  IN p_processInitiator VARCHAR(255),
  IN p_deleteFlag VARCHAR(25),
  OUT p_procStatus VARCHAR(255)
)
BEGIN IF p_deleteFlag = 'Yes' THEN
DELETE FROM
  OM_CMN_STG_ExportCommercialFinance
WHERE
  processId = p_processId;
SET
  p_procStatus = 'SUCCESS';
ELSE
DELETE FROM
  OM_CMN_STG_ExportCommercialFinance
WHERE
  processId = p_processId;

INSERT INTO OM_CMN_STG_ExportCommercialFinance (
  orderId, account, identifier, samId,
  state, productType, orderChannel,
  financeCode, processId, createdBy,
  createdOn
) (
  SELECT
    ORDE.id,
    NBNSELECT.tradingName,
    ORDE.omId,
    LOC.samId,
    LOC.state,
    'GPON',
    'Single Site',
    NSPLANDESIGN.financeCode,
    p_processId,
    p_processInitiator,
    SYSDATE()
  FROM
    OM_CMN_Order ORDE,
    OM_CMN_Location LOC,
    OM_CMN_NBNSelect NBNSELECT,
    OM_CMN_NS_NPDPlanDesign NSPLANDESIGN,
    (
      SELECT
        VAL.orderId,
        VAL.firstEntity,
        VAL.secondEntity
      FROM
        (
          SELECT
            orderId,
            (
              SELECT
                entityId
              FROM
                OM_CMN_OrderItem
              WHERE
                itemSubTypeRefId = 6
                AND orderId = T1.orderId
            ) AS firstEntity,
            (
              SELECT
                entityId
              FROM
                OM_CMN_OrderItem
              WHERE
                itemSubTypeRefId = 12
                AND orderId = T1.orderId
            ) AS secondEntity
          FROM
            (
              SELECT
                TT.orderId,
                TT.itemSubTypeRefId,
                TT.entityId
              FROM
                (
                  SELECT
                    COUNT(id) AS CNT,
                    orderId,
                    itemSubTypeRefId,
                    entityId
                  FROM
                    OM_CMN_OrderItem
                  WHERE
                    itemSubTypeRefId IN(6, 12)
                  GROUP BY
                    orderId,
                    itemSubTypeRefId
                ) TT
              WHERE
                TT.CNT = 1
            ) T1
          GROUP BY
            orderId
        ) VAL
      WHERE
        VAL.firstEntity IS NOT NULL
        AND VAL.firstEntity <> ''
        AND VAL.firstEntity <> 0
        AND VAL.secondEntity IS NOT NULL
        AND VAL.secondEntity <> ''
        AND VAL.secondEntity <> 0
    ) ITE
  WHERE
    ORDE.orderTypeRefId = 2
    AND ORDE.itemSubTypeRefId = 6
    AND ORDE.omId IS NOT NULL
    AND ORDE.omId <> ''
    AND (
      ORDE.deleteFlag IS NULL
      OR ORDE.deleteFlag = ''
    )
    AND (
      ORDE.dealId IS NULL
      OR ORDE.dealId = ''
    )
    AND ORDE.id = ITE.orderId
    AND ORDE.locationId = LOC.id
    AND (
      NSPLANDESIGN.financeCode IS NULL
      OR NSPLANDESIGN.financeCode = ''
    )
    AND ITE.firstEntity = NBNSELECT.id
    AND ITE.secondEntity = NSPLANDESIGN.id
);

INSERT INTO OM_CMN_STG_ExportCommercialFinance (
  orderId, account, identifier, samId,
  state, productType, orderChannel,
  financeCode, processId, createdBy,
  createdOn
) (
  SELECT
    ORDE.id,
    ETHERNET.tradingName,
    ORDE.omId,
    LOC.samId,
    LOC.state,
    'Enterprise Ethernet',
    'Single Site',
    NPDDESIGN.financeCode,
    p_processId,
    p_processInitiator,
    SYSDATE()
  FROM
    OM_CMN_Order ORDE,
    OM_CMN_Location LOC,
    OM_CMN_EnterpriseEthernet ETHERNET,
    OM_CMN_NPDDesign NPDDESIGN,
    (
      SELECT
        VAL.orderId,
        VAL.firstEntity,
        VAL.secondEntity
      FROM
        (
          SELECT
            orderId,
            (
              SELECT
                entityId
              FROM
                OM_CMN_OrderItem
              WHERE
                itemSubTypeRefId = 1
                AND orderId = T1.orderId
            ) AS firstEntity,
            (
              SELECT
                entityId
              FROM
                OM_CMN_OrderItem
              WHERE
                itemSubTypeRefId = 10
                AND orderId = T1.orderId
            ) AS secondEntity
          FROM
            (
              SELECT
                TT.orderId,
                TT.itemSubTypeRefId,
                TT.entityId
              FROM
                (
                  SELECT
                    COUNT(id) AS CNT,
                    orderId,
                    itemSubTypeRefId,
                    entityId
                  FROM
                    OM_CMN_OrderItem
                  WHERE
                    itemSubTypeRefId IN(1, 10)
                  GROUP BY
                    orderId,
                    itemSubTypeRefId
                ) TT
              WHERE
                TT.CNT = 1
            ) T1
          GROUP BY
            orderId
        ) VAL
      WHERE
        VAL.firstEntity IS NOT NULL
        AND VAL.firstEntity <> ''
        AND VAL.firstEntity <> 0
        AND VAL.secondEntity IS NOT NULL
        AND VAL.secondEntity <> ''
        AND VAL.secondEntity <> 0
    ) ITE
  WHERE
    ORDE.orderTypeRefId = 2
    AND ORDE.itemSubTypeRefId = 1
    AND ORDE.omId IS NOT NULL
    AND ORDE.omId <> ''
    AND (
      ORDE.deleteFlag IS NULL
      OR ORDE.deleteFlag = ''
    )
    AND (
      ORDE.dealId IS NULL
      OR ORDE.dealId = ''
    )
    AND ORDE.id = ITE.orderId
    AND ORDE.locationId = LOC.id
    AND (
      NPDDESIGN.financeCode IS NULL
      OR NPDDESIGN.financeCode = ''
    )
    AND ITE.firstEntity = ETHERNET.id
    AND ITE.secondEntity = NPDDESIGN.id
);

INSERT INTO OM_CMN_STG_ExportCommercialFinance (
  orderId, account, identifier, samId,
  state, productType, orderChannel,
  financeCode, processId, createdBy,
  createdOn
) (
  SELECT
    TMPTBLE.id,
    TMPTBLE.dealName,
    TMPTBLE.dealIdentifier,
    NULL,
    TMPTBLE.region,
    'GPON',
    'Deal-based',
    TMPTBLE.financeCode,
    p_processId,
    p_processInitiator,
    SYSDATE()
  FROM
    (
      SELECT
        DEAL.id AS id,
        DEAL.dealName AS dealName,
        DEAL.dealIdentifier AS dealIdentifier,
        LOC.state AS region,
        NSPLANDESIGN.financeCode AS financeCode
      FROM
        OM_CMN_Order ORDE,
        OM_CMN_Location LOC,
        OM_CMN_Deal DEAL,
        OM_CMN_NS_NPDPlanDesign NSPLANDESIGN,
        (
          SELECT
            VAL.orderId,
            VAL.firstEntity,
            VAL.secondEntity
          FROM
            (
              SELECT
                orderId,
                (
                  SELECT
                    entityId
                  FROM
                    OM_CMN_OrderItem
                  WHERE
                    itemSubTypeRefId = 6
                    AND orderId = T1.orderId
                ) AS firstEntity,
                (
                  SELECT
                    entityId
                  FROM
                    OM_CMN_OrderItem
                  WHERE
                    itemSubTypeRefId = 12
                    AND orderId = T1.orderId
                ) AS secondEntity
              FROM
                (
                  SELECT
                    TT.orderId,
                    TT.itemSubTypeRefId,
                    TT.entityId
                  FROM
                    (
                      SELECT
                        COUNT(id) AS CNT,
                        orderId,
                        itemSubTypeRefId,
                        entityId
                      FROM
                        OM_CMN_OrderItem
                      WHERE
                        itemSubTypeRefId IN(6, 12)
                      GROUP BY
                        orderId,
                        itemSubTypeRefId
                    ) TT
                  WHERE
                    TT.CNT = 1
                ) T1
              GROUP BY
                orderId
            ) VAL
          WHERE
            VAL.firstEntity IS NOT NULL
            AND VAL.firstEntity <> ''
            AND VAL.firstEntity <> 0
            AND VAL.secondEntity IS NOT NULL
            AND VAL.secondEntity <> ''
            AND VAL.secondEntity <> 0
        ) ITE
      WHERE
        ORDE.orderTypeRefId = 2
        AND ORDE.itemSubTypeRefId = 6
        AND (
          ORDE.deleteFlag IS NULL
          OR ORDE.deleteFlag = ''
        )
        AND ORDE.dealId IS NOT NULL
        AND ORDE.dealId <> ''
        AND LOC.state IS NOT NULL
        AND LOC.state <> ''
        AND ORDE.id = ITE.orderId
        AND ORDE.dealId = DEAL.id
        AND ORDE.locationId = LOC.id
        AND (
          NSPLANDESIGN.financeCode IS NULL
          OR NSPLANDESIGN.financeCode = ''
        )
        AND ITE.secondEntity = NSPLANDESIGN.id
    ) TMPTBLE
  GROUP BY
    TMPTBLE.dealIdentifier,
    TMPTBLE.region
);

INSERT INTO OM_CMN_STG_ExportCommercialFinance (
  orderId, account, identifier, samId,
  state, productType, orderChannel,
  financeCode, processId, createdBy,
  createdOn
) (
  SELECT
    TMPTBLE.id,
    TMPTBLE.dealName,
    TMPTBLE.dealIdentifier,
    NULL,
    TMPTBLE.region,
    'Enterprise Ethernet',
    'Deal-based',
    TMPTBLE.financeCode,
    p_processId,
    p_processInitiator,
    SYSDATE()
  FROM
    (
      SELECT
        DEAL.id AS id,
        DEAL.dealName AS dealName,
        DEAL.dealIdentifier AS dealIdentifier,
        LOC.state AS region,
        NPDDESIGN.financeCode AS financeCode
      FROM
        OM_CMN_Order ORDE,
        OM_CMN_Location LOC,
        OM_CMN_Deal DEAL,
        OM_CMN_NPDDesign NPDDESIGN,
        (
          SELECT
            VAL.orderId,
            VAL.firstEntity,
            VAL.secondEntity
          FROM
            (
              SELECT
                orderId,
                (
                  SELECT
                    entityId
                  FROM
                    OM_CMN_OrderItem
                  WHERE
                    itemSubTypeRefId = 1
                    AND orderId = T1.orderId
                ) AS firstEntity,
                (
                  SELECT
                    entityId
                  FROM
                    OM_CMN_OrderItem
                  WHERE
                    itemSubTypeRefId = 10
                    AND orderId = T1.orderId
                ) AS secondEntity
              FROM
                (
                  SELECT
                    TT.orderId,
                    TT.itemSubTypeRefId,
                    TT.entityId
                  FROM
                    (
                      SELECT
                        COUNT(id) AS CNT,
                        orderId,
                        itemSubTypeRefId,
                        entityId
                      FROM
                        OM_CMN_OrderItem
                      WHERE
                        itemSubTypeRefId IN(1, 10)
                      GROUP BY
                        orderId,
                        itemSubTypeRefId
                    ) TT
                  WHERE
                    TT.CNT = 1
                ) T1
              GROUP BY
                orderId
            ) VAL
          WHERE
            VAL.firstEntity IS NOT NULL
            AND VAL.firstEntity <> ''
            AND VAL.firstEntity <> 0
            AND VAL.secondEntity IS NOT NULL
            AND VAL.secondEntity <> ''
            AND VAL.secondEntity <> 0
        ) ITE
      WHERE
        ORDE.orderTypeRefId = 2
        AND ORDE.itemSubTypeRefId = 1
        AND (
          ORDE.deleteFlag IS NULL
          OR ORDE.deleteFlag = ''
        )
        AND ORDE.dealId IS NOT NULL
        AND ORDE.dealId <> ''
        AND LOC.state IS NOT NULL
        AND LOC.state <> ''
        AND ORDE.id = ITE.orderId
        AND ORDE.dealId = DEAL.id
        AND ORDE.locationId = LOC.id
        AND (
          NPDDESIGN.financeCode IS NULL
          OR NPDDESIGN.financeCode = ''
        )
        AND ITE.secondEntity = NPDDESIGN.id
    ) TMPTBLE
  GROUP BY
    TMPTBLE.dealIdentifier,
    TMPTBLE.region
);
SET
  p_procStatus = 'SUCCESS';
END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_GetFinanceCode;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_GetFinanceCode`(IN `stateTxt` VARCHAR(255), IN `dealId` INT, OUT financeCode VARCHAR(255))
BEGIN
SELECT DISTINCT
    PLANDESIGN.financeCode INTO financeCode
FROM
    OM_CMN_Order ORD,
    OM_CMN_Location LOC,
    OM_CMN_OrderItem ITE,
    OM_CMN_NS_NPDPlanDesign PLANDESIGN
WHERE
    ORD.dealId = dealId AND LOC.id = ORD.locationId AND LOC.state = stateTxt AND ITE.orderId = ORD.id AND ITE.itemSubTypeRefId = 12 AND PLANDESIGN.id = ITE.entityId AND(
        PLANDESIGN.financeCode IS NOT NULL OR PLANDESIGN.financeCode <> ''
    );

END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_ImportCommercialFinanceCode;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_ImportCommercialFinanceCode`(IN `p_processId` INT, OUT `p_procStatus` VARCHAR(25), IN `p_deleteFlag` VARCHAR(10))
BEGIN
        IF p_deleteFlag = 'Yes' THEN
    DELETE
FROM
    `OM_CMN_STG_CommercialFinance`
WHERE
    processId = p_processId; ELSE
UPDATE
    `OM_CMN_STG_CommercialFinance`
SET
    errorCode = 1,
    errorMessage = 'Supplied Finance Code is Empty.'
WHERE
    processId = p_processId AND (oracleProjectNumber IS NULL OR oracleProjectNumber = '');
UPDATE
    `OM_CMN_STG_CommercialFinance`
SET
    errorCode = 1,
    errorMessage = CONCAT(
        errorMessage,
        'Finance Code has multiple entry. '
    )
WHERE
    processId = p_processId AND orderChannel = 'Deal-based' AND id NOT IN(
    SELECT
        a.id
    FROM
        (
        SELECT
            *
        FROM
            `OM_CMN_STG_CommercialFinance`
        WHERE
            orderChannel = 'Deal-based'
    ) a
LEFT JOIN(
    SELECT *
    FROM
        `OM_CMN_STG_CommercialFinance`
    WHERE
        orderChannel = 'Deal-based'
) b
ON
    a.`account` = b.`account` AND a.`state` = b.`state` AND a.`productType` = b.`productType`
GROUP BY
    a.`identifier`,
    a.`productType`,
    a.`state`
);
UPDATE
    `OM_CMN_STG_CommercialFinance`
SET
    errorCode = 1,
    errorMessage = CONCAT(
        errorMessage,
        'Finance Code has multiple entry. '
    )
WHERE
    processId = p_processId AND orderChannel = 'Single Site' AND id NOT IN(
    SELECT
        a.id
    FROM
        (
        SELECT
            *
        FROM
            `OM_CMN_STG_CommercialFinance`
        WHERE
            orderChannel = 'Single Site'
    ) a
LEFT JOIN(
    SELECT *
    FROM
        `OM_CMN_STG_CommercialFinance`
    WHERE
        orderChannel = 'Single Site'
) b
ON
    a.`identifier` = b.`identifier`
GROUP BY
    a.`identifier`
);
UPDATE
    OM_CMN_STG_CommercialFinance COM,
    OM_CMN_Order ORDE,
    OM_CMN_OrderItem ITEM,
    OM_CMN_NpdDesignItem_View NPDDESIGN
SET
    COM.errorCode = 1,
    COM.errorMessage = 'System Bypass'
WHERE
    COM.errorCode IS NULL AND COM.productType = 'Enterprise Ethernet' AND COM.orderChannel = 'Single Site' AND COM.processId = p_processId AND ORDE.itemSubTypeRefId = 1 AND ORDE.orderTypeRefId = 2 AND COM.identifier = ORDE.omId AND ORDE.id = ITEM.orderId AND ITEM.itemSubTypeRefId = 10 AND ITEM.entityId = NPDDESIGN.npdDesignId AND NPDDESIGN.financeCode IS NOT NULL AND NPDDESIGN.financeCode<>'';
UPDATE
    OM_CMN_STG_CommercialFinance COM,
    OM_CMN_Order ORDE,
    OM_CMN_OrderItem ITEM,
    OM_CMN_NS_NPDPlanDesign NPDDESIGN
SET
    COM.errorCode = 1,
    COM.errorMessage = 'System Bypass'
WHERE
    COM.errorCode IS NULL AND COM.productType = 'GPON' AND COM.orderChannel = 'Single Site' AND COM.processId = p_processId AND ORDE.itemSubTypeRefId = 6 AND ORDE.orderTypeRefId = 2 AND COM.identifier = ORDE.omId AND ORDE.id = ITEM.orderId AND ITEM.itemSubTypeRefId = 12 AND ITEM.entityId = NPDDESIGN.id AND NPDDESIGN.financeCode IS NOT NULL AND NPDDESIGN.financeCode<>'';
UPDATE
    OM_CMN_STG_CommercialFinance COM,
    OM_CMN_Deal DEAL,
    OM_CMN_Location LOC,
    OM_CMN_NS_NPDPlanDesign NPDDESIGN,
    OM_CMN_OrderItem ITEM,
    OM_CMN_Order ORDE
SET
    COM.errorCode = 1,
    COM.errorMessage = 'System Bypass'
WHERE
    ORDE.dealId IS NOT NULL AND ORDE.itemSubTypeRefId = 6 AND ORDE.orderTypeRefId = 2 AND ORDE.dealId = DEAL.id AND ORDE.locationId = LOC.id AND ITEM.orderId = ORDE.id AND ITEM.itemSubTypeRefId = 12 AND ITEM.entityId = NPDDESIGN.id AND NPDDESIGN.financeCode IS NOT NULL AND NPDDESIGN.financeCode <> '' AND COM.errorCode IS NULL AND COM.productType = 'GPON' AND COM.orderChannel = 'Deal-based' AND COM.processId = p_processId AND COM.identifier = DEAL.dealIdentifier AND COM.state = LOC.state;
UPDATE
    OM_CMN_STG_CommercialFinance COM,
    OM_CMN_Deal DEAL,
    OM_CMN_Location LOC,
    OM_CMN_NpdDesignItem_View NPDDESIGN,
    OM_CMN_OrderItem ITEM,
    OM_CMN_Order ORDE
SET
    COM.errorCode = 1,
    COM.errorMessage = 'System Bypass'
WHERE
    ORDE.dealId IS NOT NULL AND ORDE.itemSubTypeRefId = 1 AND ORDE.orderTypeRefId = 2 AND ORDE.dealId = DEAL.id AND ORDE.locationId = LOC.id AND ITEM.orderId = ORDE.id AND ITEM.itemSubTypeRefId = 10 AND ITEM.entityId = NPDDESIGN.npdDesignId AND NPDDESIGN.financeCode IS NOT NULL AND NPDDESIGN.financeCode <> '' AND COM.errorCode IS NULL AND COM.productType = 'Enterprise Ethernet' AND COM.orderChannel = 'Deal-based' AND COM.processId = p_processId AND COM.identifier = DEAL.dealIdentifier AND COM.state = LOC.state;
UPDATE
    OM_CMN_NS_NPDPlanDesign PLAN
INNER JOIN(
    SELECT ITE.entityId AS entityId,
        STG_COM.oracleProjectNumber AS financeCode
    FROM
        (
        SELECT
            `id`,
            `account`,
            `identifier`,
            `samId`,
            `state`,
            `productType`,
            `orderChannel`,
            `oracleProjectNumber`,
            `errorCode`,
            `errorMessage`,
            `processId`,
            `createdBy`,
            `createdOn`
        FROM
            OM_CMN_STG_CommercialFinance
        WHERE
            productType = 'GPON' AND orderChannel = 'Deal-based' AND errorCode IS NULL
    ) STG_COM,
    (
    SELECT
        *
    FROM
        OM_CMN_Order
    WHERE
        itemSubTypeRefId = 6 AND orderTypeRefId = 2 AND dealId IS NOT NULL
) ORDE,
`OM_CMN_Deal` DEAL,
`OM_CMN_Location` LOC,
(
    SELECT
        *
    FROM
        OM_CMN_OrderItem
    WHERE
        itemSubTypeRefId = 12
    GROUP BY
        orderId,
        entityId
) ITE
WHERE
    STG_COM.processId = p_processId AND ORDE.dealId = DEAL.id AND STG_COM.identifier = DEAL.dealIdentifier AND ORDE.locationId = LOC.id AND LOC.state = STG_COM.state AND ORDE.id = ITE.orderId
) JOINT
ON
    PLAN.id = JOINT.entityId
SET
    PLAN.financeCode = JOINT.financeCode
WHERE
    PLAN.id = JOINT.entityId AND(
        PLAN.financeCode IS NULL OR PLAN.financeCode = ''
    );
UPDATE
    OM_CMN_NPDDesign PLAN
INNER JOIN(
    SELECT ITE.entityId AS entityId,
        STG_COM.oracleProjectNumber AS financeCode
    FROM
        (
        SELECT
            `id`,
            `account`,
            `identifier`,
            `samId`,
            `state`,
            `productType`,
            `orderChannel`,
            `oracleProjectNumber`,
            `errorCode`,
            `errorMessage`,
            `processId`,
            `createdBy`,
            `createdOn`
        FROM
            OM_CMN_STG_CommercialFinance
        WHERE
            productType = 'Enterprise Ethernet' AND orderChannel = 'Deal-based' AND errorCode IS NULL
        GROUP BY
            `identifier`,
            `state`,
            `productType`
    ) STG_COM,
    (
    SELECT
        *
    FROM
        OM_CMN_Order
    WHERE
        itemSubTypeRefId = 1 AND orderTypeRefId = 2 AND dealId IS NOT NULL
) ORDE,
`OM_CMN_Deal` DEAL,
`OM_CMN_Location` LOC,
(
    SELECT
        *
    FROM
        OM_CMN_OrderItem
    WHERE
        itemSubTypeRefId = 10
    GROUP BY
        orderId,
        entityId
) ITE
WHERE
    STG_COM.processId = p_processId AND ORDE.dealId = DEAL.id AND STG_COM.identifier = DEAL.dealIdentifier AND ORDE.locationId = LOC.id AND LOC.state = STG_COM.state AND ORDE.id = ITE.orderId
) JOINT
ON
    PLAN.id = JOINT.entityId
SET
    PLAN.financeCode = JOINT.financeCode
WHERE
    PLAN.id = JOINT.entityId AND(
        PLAN.financeCode IS NULL OR PLAN.financeCode = ''
    );
UPDATE
    OM_CMN_NS_NPDPlanDesign PLAN
INNER JOIN(
    SELECT ITE.entityId AS entityId,
        STG_COM.oracleProjectNumber AS financeCode
    FROM
        (
        SELECT
            `id`,
            `account`,
            `identifier`,
            `samId`,
            `state`,
            `productType`,
            `orderChannel`,
            `oracleProjectNumber`,
            `errorCode`,
            `errorMessage`,
            `processId`,
            `createdBy`,
            `createdOn`
        FROM
            OM_CMN_STG_CommercialFinance
        WHERE
            productType = 'GPON' AND orderChannel = 'Single Site' AND errorCode IS NULL
    ) STG_COM,
    (
    SELECT
        *
    FROM
        OM_CMN_Order
    WHERE
        itemSubTypeRefId = 6 AND orderTypeRefId = 2
) ORDE,
(
    SELECT
        *
    FROM
        OM_CMN_OrderItem
    WHERE
        itemSubTypeRefId = 12
    GROUP BY
        orderId,
        entityId
) ITE
WHERE
    STG_COM.processId = p_processId AND STG_COM.identifier = ORDE.omId AND ITE.orderId = ORDE.id
) JOINT
ON
    PLAN.id = JOINT.entityId
SET
    PLAN.financeCode = JOINT.financeCode
WHERE
    PLAN.id = JOINT.entityId AND(
        PLAN.financeCode IS NULL OR PLAN.financeCode = ''
    );
UPDATE
    OM_CMN_NPDDesign PLAN
INNER JOIN(
    SELECT ITE.entityId AS entityId,
        STG_COM.oracleProjectNumber AS financeCode
    FROM
        (
        SELECT
            `id`,
            `account`,
            `identifier`,
            `samId`,
            `state`,
            `productType`,
            `orderChannel`,
            `oracleProjectNumber`,
            `errorCode`,
            `errorMessage`,
            `processId`,
            `createdBy`,
            `createdOn`
        FROM
            OM_CMN_STG_CommercialFinance
        WHERE
            productType = 'Enterprise Ethernet' AND orderChannel = 'Single Site' AND errorCode IS NULL
    ) STG_COM,
    (
    SELECT
        *
    FROM
        OM_CMN_Order
    WHERE
        itemSubTypeRefId = 1 AND orderTypeRefId = 2
) ORDE,
(
    SELECT
        *
    FROM
        OM_CMN_OrderItem
    WHERE
        itemSubTypeRefId = 10
    GROUP BY
        orderId,
        entityId
) ITE
WHERE
    STG_COM.processId = p_processId AND STG_COM.identifier = ORDE.omId AND ITE.orderId = ORDE.id
) JOINT
ON
    PLAN.id = JOINT.entityId
SET
    PLAN.financeCode = JOINT.financeCode
WHERE
    PLAN.id = JOINT.entityId AND(
        PLAN.financeCode IS NULL OR PLAN.financeCode = ''
    );
    END IF;
SET
    p_procStatus = "SUCCESS";
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_ImportMilestones;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_ImportMilestones`(IN `PROCESS_ID` INT, IN `RECORD_TYPE_REFID` INT, OUT `PROC_STATUS` VARCHAR(25), IN `IS_DELETE_FLAG` VARCHAR(10))
BEGIN

IF IS_DELETE_FLAG='Yes' THEN
DELETE FROM `OM_CMN_STG_Milestone` WHERE processId = PROCESS_ID;
ELSE
	UPDATE
	 OM_CMN_STG_Milestone
	 SET processId= PROCESS_ID;

    UPDATE
        `OM_CMN_STG_Milestone`
    SET
        errorFlag = 2,
        errorMessage = 'Supplied Project ID was not found in the system. Please check if this P6 project is related to Business Segment.'
    WHERE
        processId = PROCESS_ID AND aycaId NOT IN(
        SELECT
            USRN
        FROM
            OM_CMN_Order
        WHERE
            USRN IS NOT NULL AND(
                deleteFlag IS NULL OR deleteFlag = 0
            )
    );
UPDATE
    `OM_CMN_STG_Milestone` MIL
INNER JOIN(
    SELECT
        USRN,
        id
    FROM
        `OM_CMN_Order`
    WHERE
        USRN IS NOT NULL AND(
            deleteFlag IS NULL OR deleteFlag = 0
        )
) ORD
ON
    MIL.aycaId = ORD.USRN AND MIL.processId = PROCESS_ID
SET
    MIL.orderId = ORD.id
WHERE
    MIL.aycaId = ORD.USRN AND MIL.processId = PROCESS_ID;
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory Project ID is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND aycaId IS NULL OR aycaId = '';
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory ActivityId is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND activityId IS NULL OR activityName = '';
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory ActivityName is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND activityName IS NULL OR activityName = '';
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory BaselineFinish Date is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND baselineFinishDate IS NULL;
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory Finish Start Date is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND finishDate IS NULL OR finishDate = '';

	UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory ActualFinish Date is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND actualFinishDate IS NULL OR actualFinishDate = '';
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Mandatory Actualised is missing."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND actualised IS NULL OR actualised = '';
UPDATE
    `OM_CMN_STG_Milestone`
SET
    errorMessage = CONCAT(
        errorMessage,
        "Invalid Actualised value received. Supported values are [Y/N]."
    ),
    errorFlag = 1
WHERE
    errorFlag <> 2 AND processId = PROCESS_ID AND actualised IS NOT NULL AND actualised NOT IN('Y', 'N', 'y', 'n');
INSERT INTO `OM_CMN_Milestone`(
    `id`,
    `recordTypeRefId`,
    `entityId`,
    `activityCode`,
    `activityName`,
    `projectManagerUserName`,
    `projectManagerName`,
    `baselineStart`,
    `baselineFinish`,
    `forecastStart`,
    `forecastFinish`,
    `actualStart`,
    `actualFinish`,
    `actualised`,
    `createdBy`,
    `createdOn`,
    `updatedBy`,
    `updatedOn`,
    `isActive`
)
SELECT NULL
    ,
    RECORD_TYPE_REFID,
    ORD.`id`,
    STG.`activityId`,
    STG.`activityName`,
    STG.`SIMProjectManagerUsername`,
    STG.`SIMProjectManagerName`,
    OM_CMN_FUNC_ConvertStringToDate(
        STG.`baselineStartDate`
    ),
    OM_CMN_FUNC_ConvertStringToDate(
        STG.`baselineFinishDate`
    ),
    OM_CMN_FUNC_ConvertStringToDate(STG.`startDate`),
    OM_CMN_FUNC_ConvertStringToDate(STG.`finishDate`),
    OM_CMN_FUNC_ConvertStringToDate(STG.`actualStartDate`),
    OM_CMN_FUNC_ConvertStringToDate(STG.`actualFinishDate`),
    UPPER(STG.`actualised`) ,
'System',
NOW(), STG.`lastModifiedBy`, OM_CMN_FUNC_ConvertStringToDate(STG.`lastModifiedDate`),
1
FROM
    `OM_CMN_STG_Milestone` STG,
    `OM_CMN_Order` ORD
WHERE
    STG.processId = PROCESS_ID AND CONCAT(STG.orderId, STG.activityId) NOT IN(
    SELECT
        CONCAT(entityId, activityCode)
    FROM
        OM_CMN_Milestone
) AND(
    STG.`errorFlag` = 0 OR STG.`errorFlag` IS NULL
) AND(
    ORD.deleteFlag IS NULL OR ORD.deleteFlag = 0
) AND ORD.USRN IS NOT NULL AND STG.`aycaId` = ORD.`USRN`;
UPDATE
    OM_CMN_Milestone MIL
INNER JOIN(
    SELECT
        `id`,
        `aycaId`,
        `activityId`,
        `activityName`,
        `SIMProjectManagerUsername`,
        `SIMProjectManagerName`,
        `baselineStartDate`,
        `baselineFinishDate`,
        `startDate`,
        `finishDate`,
        `actualStartDate`,
        `actualFinishDate`,
        `actualised`,
        `lastModifiedDate`,
        `lastModifiedBy`,
        `LastModified ByName`,
        `orderId`,
        `errorFlag`,
        `errorMessage`,
        `processId`
    FROM
        `OM_CMN_STG_Milestone`
    WHERE
        processId = PROCESS_ID
) STG
ON
    MIL.entityId = STG.orderId AND MIL.activityCode = STG.activityId
SET
    MIL.`activityName` = STG.`activityName`,
    MIL.`projectManagerUserName` = STG.SIMProjectManagerUsername,
    MIL.`projectManagerName` = STG.SIMProjectManagerName,
    MIL.`baselineStart` = OM_CMN_FUNC_ConvertStringToDate(
        STG.`baselineStartDate`
    ),
    MIL.`baselineFinish` = OM_CMN_FUNC_ConvertStringToDate(
        STG.`baselineFinishDate`
    ),
    MIL.`forecastStart` = OM_CMN_FUNC_ConvertStringToDate(STG.`startDate`),
    MIL.`forecastFinish` = OM_CMN_FUNC_ConvertStringToDate(STG.`finishDate`),
    MIL.`actualStart` = OM_CMN_FUNC_ConvertStringToDate(STG.`actualStartDate`),
    MIL.`actualFinish` = OM_CMN_FUNC_ConvertStringToDate(STG.`actualFinishDate`),
    MIL.`actualised` = UPPER(STG.actualised),
    MIL.`updatedBy` = STG.lastModifiedBy,
    MIL.`updatedOn` = OM_CMN_FUNC_ConvertStringToDate(STG.`lastModifiedDate`)
WHERE
    MIL.entityId = STG.orderId AND MIL.activityCode = STG.activityId;


END IF;
SET
    PROC_STATUS = "SUCCESS";
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS OM_CMN_SP_InsertDeals;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_InsertDeals`(IN p_processId INT, IN p_createdBy VARCHAR(255))
BEGIN
    DECLARE p_stagingSiteIds VARCHAR(5000);
	DECLARE p_dealIds INT ;
	DECLARE p_counter INT ;
	DECLARE p_count INT;
    SET
        p_counter = 1 ;

    SELECT GROUP_CONCAT(QRY.id separator ',') INTO p_stagingSiteIds
	FROM
		(SELECT `id`
			FROM
			`OM_CMN_STG_BSSite`
			WHERE
				processId = p_processId
			GROUP BY
				dealName, RSP, tradingName) QRY;


	IF p_stagingSiteIds IS NOT NULL
		THEN
			WHILE p_counter <= (SELECT COUNT(id) FROM (SELECT `id` FROM `OM_CMN_STG_BSSite` WHERE processId = p_processId GROUP BY 	dealName, RSP, tradingName) QRY)
				DO
					SET p_dealIds = OM_CMN_FUNC_InsertDeal(OM_CMN_SplitStr(p_stagingSiteIds,',',p_counter), p_createdBy);
					SET p_counter = p_counter + 1 ;
			END WHILE ;
	END IF ;

END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_InsertOrderSecurity;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_InsertOrderSecurity`()
BEGIN

	   DECLARE hostname_v VARCHAR(100) ;
	START TRANSACTION;

	Select @@hostname INTO hostname_v;
	IF hostname_v = 'nbncotest.saas.appiancloud.com'
	   THEN
			insert into OM_CMN_OrderSecurity (orderId,username) select o.id,'!1078!'
			from OM_CMN_Order o LEFT JOIN OM_CMN_OrderSecurity sec ON o.id = sec.orderId WHERE 	sec.id IS NULL;

            ELSE IF hostname_v = 'nbncouat.saas.appiancloud.com'
			THEN
			insert into OM_CMN_OrderSecurity (orderId,username) select o.id,'!999!'
			from OM_CMN_Order o LEFT JOIN OM_CMN_OrderSecurity sec ON o.id = sec.orderId WHERE 	sec.id IS NULL;

            ELSE IF hostname_v = 'nbncosandbox.saas.appiancloud.com'
			THEN
			insert into OM_CMN_OrderSecurity (orderId,username) select o.id,'!1150!'
			from OM_CMN_Order o LEFT JOIN OM_CMN_OrderSecurity sec ON o.id = sec.orderId WHERE 	sec.id IS NULL;

            ELSE IF hostname_v = 'nbncodev2.saas.appiancloud.com'
			THEN
			insert into OM_CMN_OrderSecurity (orderId,username) select o.id,'!44!'
			from OM_CMN_Order o LEFT JOIN OM_CMN_OrderSecurity sec ON o.id = sec.orderId WHERE 	sec.id IS NULL;

            ELSE IF hostname_v = 'nbncopusp.saas.appiancloud.com'
			THEN
			insert into OM_CMN_OrderSecurity (orderId,username) select o.id,'!933!'
			from OM_CMN_Order o LEFT JOIN OM_CMN_OrderSecurity sec ON o.id = sec.orderId WHERE 	sec.id IS NULL;

			ELSE IF hostname_v = 'nbnco.saas.appiancloud.com'
			THEN
			insert into OM_CMN_OrderSecurity (orderId,username) select o.id,'!1016!'
			from OM_CMN_Order o LEFT JOIN OM_CMN_OrderSecurity sec ON o.id = sec.orderId WHERE 	sec.id IS NULL;


	END IF ;
	END IF;
	END IF ;
	END IF;
	END IF ;
	END IF;
COMMIT;
	END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_InsertProcessDecisions;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_InsertProcessDecisions`(IN p_orderId INT)
BEGIN
START TRANSACTION;

INSERT INTO
	OM_CMN_ProcessDecision
(orderId, decisionFlag, name, updatedOnDTime, updatedBy)
SELECT
	p_orderId,
	d.defaultValue,
	d.name,
	NOW(),
	'Appian System'
FROM
	OM_CMN_R_ProcessDecisionRef d
INNER JOIN
	OM_CMN_OrderItem item
ON
	item.itemSubTypeRefId = d.itemSubTypeRefId
AND
	item.mainLineItemFlag = 1
AND
	item.orderId = p_orderId;

COMMIT;
select
	id, orderId, decisionFlag, name, updatedOnDTime, updatedBy
from
	OM_CMN_ProcessDecision
where
	orderId = p_orderId;

END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS OM_CMN_SP_JSON_UpdateOpo;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_JSON_UpdateOpo`(
	IN p_opo JSON,
	IN p_orderId INT
)
BEGIN

  UPDATE
	OM_CMN_Order
  SET
	opo = p_opo
  WHERE
	id = p_orderId;

  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_JSON_UpdateServiceLog;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_JSON_UpdateServiceLog`(
	IN p_id INT
	,IN p_startTime DATETIME
	,IN p_endTime DATETIME
	,IN p_errorOccurred TINYINT(1)
	,IN p_processName VARCHAR(255)
	,IN p_notificationType VARCHAR(255)
	,IN p_serviceTypeId INT
	,IN p_createdBy VARCHAR(255)
	,IN p_retryCount INT
	,IN p_appianProcessId INT
	,IN p_entityId INT
	,IN p_productType VARCHAR(255)
	,IN p_requestObject VARCHAR(5000)
	,IN p_responseObject VARCHAR(5000)
	,IN p_responseJson JSON
	,IN p_intNullPlaceholder INT
)
BEGIN
	

	START TRANSACTION;

	UPDATE
		OM_CMN_ServiceLog
	SET
		responseJson = p_responseJson
		,requestObject = p_requestObject
		,responseObject = p_responseObject
		,startTime = p_startTime
		,endTime = p_endTime
		,errorOccurred = p_errorOccurred
		,processName=p_processName
		,notificationType=p_notificationType
		,serviceTypeId= CASE WHEN p_serviceTypeId = p_intNullPlaceholder THEN NULL ELSE p_serviceTypeId END
		,createdBy=p_createdBy
		,retryCount= CASE WHEN p_retryCount = p_intNullPlaceholder THEN NULL ELSE p_retryCount END
		,entityId= CASE WHEN p_entityId = p_intNullPlaceholder THEN NULL ELSE p_entityId END
		,appianProcessId= CASE WHEN p_appianProcessId = p_intNullPlaceholder THEN NULL ELSE p_appianProcessId END
		,productType=p_productType
	WHERE
		id = p_id;
	SELECT ROW_COUNT() AS 'row_count';

	COMMIT;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_JSON_ValidateFallout;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_JSON_ValidateFallout`(
	IN p_requestJson JSON
)
BEGIN
	
	-- CHECK for success or otherwise
	SET @success = (SELECT JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.fallout.status')));
	SET @validJsonError = "{\"fallout\":{\"status\":\"error\",\"requestId\": \"235afc4e-ce40-441f-8e69-0ead31fc20a2\",\"orderId\":\"BCO000000004228\",\"errorCode\":\"000000\",\"errorMessage\":\"unable to connect to InstantLink from SOM D&A\"}}";

	IF (@success IS NULL) OR (@success <> 'success') THEN
	-- ensure all required fields are present and are not blank
		SELECT CASE WHEN
		(IFNULL(JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.fallout.status')),"") <> "")
		AND (IFNULL(JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.fallout.requestId')),"") <> "")
		AND (IFNULL(JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.fallout.errorCode')),"") <> "")
		AND (IFNULL(JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.fallout.errorMessage')),"") <> "")
			THEN 1 ELSE 0 END AS 'valid',
			CAST(JSON_PRETTY(@validJsonError) AS CHAR(1000)) AS expectedFormat;
	ELSE
		SELECT
			TRUE AS 'valid';
	END IF;
  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_MilestoneNotification;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_MilestoneNotification`(OUT `PROC_STATUS` VARCHAR(25), OUT `DP_STATE` VARCHAR(255), OUT `UNIQUE_PROJECTMANAGER` VARCHAR(55), OUT `UNIQUE_STATE` VARCHAR(255), IN `INTERVAL_IN` INT)
BEGIN

	TRUNCATE OM_CMN_STG_MilestonesNotification;

                INSERT INTO `OM_CMN_STG_MilestonesNotification`(
                                `p6ProjectId`,
                                `appianId`,
                                `projectNumber`,
                                `locId`,
                                `siteAddress`,
                                `region`,
                                `deliveryPartner`,
                                `activityId`,
                                `activityName`,
                                `baselineStartDate`,
                                `baselineFinishDate`,
                                `forecastStartDate`,
                                `forecastFinishDate`,
                                `simProjectManagerName`,
                                `simProjectManager`,
                                `lastModifiedDate`,
                                `lastModifiedBy`,
                                expiredFlag
                )
                SELECT
                                ORDE.USRN AS 'p6ProjectId',
                                ORDE.omId AS 'appianId',
                                NULL AS 'projectNumber',
                                LOCATION.locId AS 'locId',
                                LOCATION.addressFullText AS 'SiteAddress',
                                LOCATION.state AS 'Region',
                                NPDPLAN.deliveryPartner AS 'DP',
                                MILESTONE.activityCode AS 'activityId',
                                MILESTONE.activityName AS 'activityName',
                                MILESTONE.baselineStart AS 'baselineStart',
                                MILESTONE.baselineFinish AS 'baselineFinish',
                                MILESTONE.forecastStart AS 'forecastStart',
                                MILESTONE.forecastFinish AS 'forecastFinish',
                                MILESTONE.projectManagerUserName AS 'SIMProjectManager',
                                MILESTONE.projectManagerName AS 'projectManagerName',
                                MILESTONE.updatedOn AS 'LastModifiedOn',
                                MILESTONE.updatedBy AS 'LastModifedBy',
                                (CASE WHEN MILESTONE.forecastFinish < CURDATE() THEN '1' ELSE 0  END)  expiredFlag
                FROM
                                (
                                                (
                                                                (
                                                                                (
                                                                                                (select * from OM_CMN_Milestone where forecastFinish < DATE_Add(curdate(),INTERVAL INTERVAL_IN DAY) AND activityCode in ("DES-SUB","CON-START","CON-COMP","PD-SPC","NPD-ISSUE","NDD-1030","DES-SUB","DDD-FDA","CON-START","CON-COMP","RFS","PD-SPC","PCDL1000") AND actualised='N') MILESTONE
                                                                                LEFT JOIN OM_CMN_Order ORDE ON
                                                                                                MILESTONE.recordTypeRefId = 2 AND MILESTONE.entityId = ORDE.id
                                                                                )
                                                                LEFT JOIN OM_CMN_Location LOCATION ON
                                                                                ORDE.locationId = LOCATION.id
                                                                )
                                                LEFT JOIN OM_CMN_OrderItem ORDERITEM ON
                                                                ORDERITEM.itemSubTypeRefId = 12 AND ORDE.id = ORDERITEM.orderId
                                                )
                                LEFT JOIN OM_CMN_NS_NPDPlanDesign NPDPLAN ON
                                                ORDERITEM.entityId = NPDPLAN.id
                                );

                SET DP_STATE = (SELECT GROUP_CONCAT(distinct concat(`deliveryPartner`,'||',`region`) SEPARATOR ',')  FROM `OM_CMN_STG_MilestonesNotification` WHERE deliveryPartner IS NOT NULL AND deliveryPartner<>'');

                SET UNIQUE_PROJECTMANAGER = (SELECT GROUP_CONCAT(distinct (`simProjectManagerName`) SEPARATOR ',') FROM `OM_CMN_STG_MilestonesNotification` where simProjectManagerName is not null AND simProjectManagerName<>'');

                SET UNIQUE_STATE = (SELECT CAST(GROUP_CONCAT(distinct (`region`) SEPARATOR ',') AS CHAR(2000)) FROM `OM_CMN_STG_MilestonesNotification` where region is not null);


                SET PROC_STATUS = "SUCCESS";

                END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS OM_CMN_SP_SetCancelOrderProcessDecisions;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_SetCancelOrderProcessDecisions`(IN `p_orderId` INT, IN `p_orderStatusId_Ack` INT, IN `p_orderSubStatusId_designAssign` INT, IN `p_orderSubStatusId_prodCreation` INT, IN `p_orderSubStatusId_orderAcceptance` INT, IN `p_orderSubStatusId_orderCreation` INT)
    COMMENT 'Sets process decisions to allow dynamic process flow for a Cancel Order Request and returns a list of updated process decisions of the order'
BEGIN


	UPDATE
		OM_CMN_ProcessDecision pd
	INNER JOIN
		OM_CMN_Order o
	ON
		o.id = p_orderId
	AND
		o.id = pd.orderId
	LEFT JOIN
		OM_CMN_ProcessDecision pdJoin
	ON
		pdJoin.orderId = o.id
	AND
		pdJoin.name = 'designAssignRequired'
	AND
		pdJoin.decisionFlag = 1
	SET
		pd.decisionFlag = 1
	WHERE
		pd.name = 'serviceOrderCancelRequired'
	AND
		o.statusId >= p_orderStatusId_Ack 
	AND
		o.substatusId >= p_orderSubStatusId_designAssign 
	AND
		pdJoin.id IS NOT NULL;


	UPDATE
		OM_CMN_ProcessDecision pd
	INNER JOIN
		OM_CMN_Order o
	ON
		o.id = p_orderId
	AND
		o.id = pd.orderId
	SET
		pd.decisionFlag = 1
	WHERE
		pd.name = 'productCancelRequired'
	AND
		o.statusId >= p_orderStatusId_Ack  
	AND
		o.substatusId >= p_orderSubStatusId_prodCreation; 


	UPDATE
		OM_CMN_ProcessDecision pd
	INNER JOIN
		OM_CMN_Order o
	ON
		o.id = p_orderId
	AND
		o.id = pd.orderId
	LEFT JOIN
		OM_CMN_ProcessDecision pdRorRequired
	ON
		pdRorRequired.orderId = o.id
	AND
		pdRorRequired.name = 'rorRequired'
	AND
		pdRorRequired.decisionFlag = 1
	LEFT JOIN
		OM_CMN_ProcessDecision pdShortfall
	ON
		pdShortfall.orderId = o.id
	AND
		pdShortfall.name = 'shortfall'
	AND
		pdShortfall.decisionFlag = 1
	SET
		pd.decisionFlag = 1
	WHERE
		pd.name = 'resourceOrderCancelRequired'
	AND
	(
		-- we only care about the substatusId if it is currently at the Acknowledged status
		(
			o.statusId >= p_orderStatusId_Ack 
		AND
			o.substatusId >= p_orderSubStatusId_orderAcceptance 
		)
		-- if we are past the Acknowledged status, we do not care about substatusId
		OR
		(
			o.statusId > p_orderStatusId_Ack 
		)
	)
	AND
		pdRorRequired.id IS NOT NULL
	AND
		pdShortfall.id IS NOT NULL;



	UPDATE
		OM_CMN_ProcessDecision pd
	INNER JOIN
		OM_CMN_Order o
	ON
		o.id = p_orderId
	AND
		o.id = pd.orderId
	LEFT JOIN
		OM_CMN_ProcessDecision pdJoin
	ON
		pdJoin.orderId = o.id
	AND
		pdJoin.name = 'productCreationRequired'
	AND
		pdJoin.decisionFlag = 1
	SET
		pd.decisionFlag = 1
	WHERE
		pd.name = 'productOrderCancelRequired'
	AND
		o.statusId >= p_orderStatusId_Ack 
	AND
		o.substatusId >= p_orderSubStatusId_orderCreation 
	AND
		pdJoin.id IS NOT NULL;



	UPDATE
		OM_CMN_ProcessDecision pd
	INNER JOIN
		OM_CMN_Order o
	ON
		o.id = p_orderId
	AND
		o.id = pd.orderId
	LEFT JOIN
		OM_CMN_ProcessDecision pdrorAccepted
	ON
		pdrorAccepted.orderId = o.id
	AND
		pdrorAccepted.name = 'rorAccepted'
	AND
		pdrorAccepted.decisionFlag = 1
	LEFT JOIN
		OM_CMN_ProcessDecision pdShortfall
	ON
		pdShortfall.orderId = o.id
	AND
		pdShortfall.name = 'shortfall'
	AND
		pdShortfall.decisionFlag = 1
	SET
		pd.decisionFlag = 1
	WHERE
		pd.name = 'NPDCancelRequired'
	AND
		pdrorAccepted.id IS NOT NULL
	AND
		pdShortfall.id IS NOT NULL;


	SELECT
		`id`, `orderId`, `processDecisionRefId`, `decisionFlag`, `updatedOnDTime`, `updatedBy`, `name`, `createdOnDTime`
	FROM
		OM_CMN_ProcessDecision
	WHERE
		orderId = p_orderId;

  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_UpdateLookUp;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_UpdateLookUp`()
BEGIN

	   DECLARE hostname_v VARCHAR(100) ;
	START TRANSACTION;

	Select @@hostname INTO hostname_v;

	IF hostname_v = 'nbncotest.saas.appiancloud.com'
	   THEN
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1078!' WHERE `OM_CMN_R_LookupRef`.`label` = 'OM CMN Internal User';
            UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1190!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Visionstream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1206!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Downer';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1198!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Fulton Hogan';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1182!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Servicestream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1194!' WHERE `OM_CMN_R_LookupRef`.`label` = 'SA Power Networks';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1210!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Decon';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1202!' WHERE `OM_CMN_R_LookupRef`.`label` = 'WBHO';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1186!' WHERE `OM_CMN_R_LookupRef`.`label` = 'UCG';

            ELSE IF hostname_v = 'nbncouat.saas.appiancloud.com'
			THEN
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!999!' WHERE `OM_CMN_R_LookupRef`.`label` = 'OM CMN Internal User';
            UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1099!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Visionstream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1115!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Downer';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1107!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Fulton Hogan';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1091!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Servicestream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1103!' WHERE `OM_CMN_R_LookupRef`.`label` = 'SA Power Networks';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1119!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Decon';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1111!' WHERE `OM_CMN_R_LookupRef`.`label` = 'WBHO';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1095!' WHERE `OM_CMN_R_LookupRef`.`label` = 'UCG';

            ELSE IF hostname_v = 'nbncosandbox.saas.appiancloud.com'
			THEN
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1150!' WHERE `OM_CMN_R_LookupRef`.`label` = 'OM CMN Internal User';
            UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1252!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Visionstream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1268!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Downer';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1260!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Fulton Hogan';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1244!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Servicestream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1256!' WHERE `OM_CMN_R_LookupRef`.`label` = 'SA Power Networks';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1272!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Decon';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1264!' WHERE `OM_CMN_R_LookupRef`.`label` = 'WBHO';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1248!' WHERE `OM_CMN_R_LookupRef`.`label` = 'UCG';

            ELSE IF hostname_v = 'nbncodev2.saas.appiancloud.com'
			THEN
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!40!' WHERE `OM_CMN_R_LookupRef`.`label` = 'OM CMN Internal User';
            UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!160!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Visionstream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!176!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Downer';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!168!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Fulton Hogan';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!152!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Servicestream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!164!' WHERE `OM_CMN_R_LookupRef`.`label` = 'SA Power Networks';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!180!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Decon';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!172!' WHERE `OM_CMN_R_LookupRef`.`label` = 'WBHO';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!156!' WHERE `OM_CMN_R_LookupRef`.`label` = 'UCG';

            ELSE IF hostname_v = 'nbncopusp.saas.appiancloud.com'
			THEN
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!932!' WHERE `OM_CMN_R_LookupRef`.`label` = 'OM CMN Internal User';
            UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1024!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Visionstream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1040!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Downer';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1032!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Fulton Hogan';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1016!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Servicestream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1028!' WHERE `OM_CMN_R_LookupRef`.`label` = 'SA Power Networks';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1044!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Decon';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1036!' WHERE `OM_CMN_R_LookupRef`.`label` = 'WBHO';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1020!' WHERE `OM_CMN_R_LookupRef`.`label` = 'UCG';

			ELSE IF hostname_v = 'nbnco.saas.appiancloud.com'
			THEN
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1016!' WHERE `OM_CMN_R_LookupRef`.`label` = 'OM CMN Internal User';
            UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1050!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Visionstream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1066!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Downer';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1058!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Fulton Hogan';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1042!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Servicestream';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1054!' WHERE `OM_CMN_R_LookupRef`.`label` = 'SA Power Networks';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1070!' WHERE `OM_CMN_R_LookupRef`.`label` = 'Decon';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1062!' WHERE `OM_CMN_R_LookupRef`.`label` = 'WBHO';
			UPDATE `OM_CMN_R_LookupRef` SET `OM_CMN_R_LookupRef`.`value` = '!1046!' WHERE `OM_CMN_R_LookupRef`.`label` = 'UCG';


	END IF ;
	END IF;
	END IF ;
	END IF;
	END IF ;
	END IF;
COMMIT;
	END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_UpdateProductHeaderId;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_UpdateProductHeaderId`(
	IN p_orderId INT,
	IN p_productHeaderId INT
)
BEGIN

  UPDATE
	OM_CMN_Order
  SET
	productHeaderId = p_productHeaderId
  WHERE
	id = p_orderId;

  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS OM_CMN_SP_UpdateStagingBSSites;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_UpdateStagingBSSites`(IN `SELECTED_ID` VARCHAR(5000), IN `PROCESS_ID` INT(255), IN `COUNT` INT(255))
BEGIN

 DECLARE CNT INT default 0;
  SET CNT = 1;

  WHILE CNT <= COUNT DO
     UPDATE `OM_CMN_STG_BSSite` SET `isCommenced`= 1 where processId=PROCESS_ID AND id = OM_CMN_SplitStr(SELECTED_ID, ';', CNT);
    SET CNT = CNT + 1;
  END WHILE;
UPDATE `OM_CMN_STG_BSSite` SET `isCommenced`= 0 where processId=PROCESS_ID AND `isCommenced` IS NULL;
 COMMIT;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_UpdateStagingSiteOmID;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_UpdateStagingSiteOmID`(IN p_omID VARCHAR(255), IN p_itemSubTypeRefId INT, IN p_channel VARCHAR(255), IN p_USRN VARCHAR(255))
BEGIN

	IF p_itemSubTypeRefId = 6 AND p_channel = 'Manual (PDP)'

		THEN
			UPDATE `OM_CMN_STG_BSSite` SET `OmID` = p_omID
				WHERE `USRN` = p_USRN;

	END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_ValidateBSSitesStaging;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_ValidateBSSitesStaging`(IN `p_processId` INT, OUT `p_errorDesc` VARCHAR(255), OUT `p_isError` BOOLEAN)
BEGIN

declare v_isError INT DEFAULT FALSE;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
 SET p_errorDesc = 'SQLException invoked',p_isError = 1;

CALL OM_CMN_SP_ValidateForGenericErrors(p_processId,p_isError);
SELECT p_isError INTO v_isError from dual;

IF v_isError = 0 THEN

CALL OM_CMN_SP_ValidateForSpecificErrors(p_processId,p_isError);
SELECT p_isError INTO v_isError from dual;

ELSE
SET p_isError = 1;

END IF;

COMMIT;
SET p_isError = 0;
END$$
DELIMITER ;



DROP PROCEDURE IF EXISTS OM_CMN_SP_ValidateForSpecificErrors;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_ValidateForSpecificErrors`(IN `p_processId` INT, OUT `p_isError` INT)
    NO SQL
BEGIN

 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 SET p_isError = 1 ;


UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Matching USRN record found in the input file. Please review.'
    )
WHERE
    USRN IN (SELECT QRY.`USRN` FROM (SELECT `USRN`,COUNT(ID) CNT FROM `OM_CMN_STG_BSSite` WHERE `processId`=p_processId GROUP BY `USRN`) QRY WHERE QRY.CNT>1)
	and processId = p_processId and (errorDetails not like ('%IS NULL%') OR errorDetails is NULL OR errorDetails = '');

UPDATE `OM_CMN_STG_BSSite`
SET
    errorDetails = OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'No Special characters are allowed in USRN.'
    )
WHERE id IN ( SELECT VAL2.id FROM (
SELECT id, USRN REGEXP "[$&+,:;=?@#|'<>.^*()%!]" SPECCHAR FROM OM_CMN_STG_BSSite WHERE `processId`=p_processId AND (errorDetails is NULL OR errorDetails = '')) VAL2 WHERE VAL2.SPECCHAR=1);

	UPDATE
    `OM_CMN_STG_BSSite` SIT
INNER JOIN(
    SELECT
        USRN,
        id
    FROM
        `OM_CMN_Order`
    WHERE
        USRN IS NOT NULL AND(
            deleteFlag IS NULL OR deleteFlag = 0
        ) AND statusId NOT IN(22, 23)
) ORD
ON
    SIT.USRN = ORD.USRN AND SIT.processId = p_processId and (errorDetails not like ('%IS NULL%') OR errorDetails is NULL OR errorDetails = '')
SET
     SIT.errorDetails = OM_CMN_FUNC_ConcatenateString(
        SIT.errorDetails,
        'An order is already in-progress for matching USRN. Please review.'
    )
WHERE
    SIT.USRN = ORD.USRN AND SIT.processId = p_processId and (errorDetails not like ('%IS NULL%') OR errorDetails is NULL OR errorDetails = '');

UPDATE
    `OM_CMN_STG_BSSite` SIT1
INNER JOIN(
    SELECT
        USRN,
        id
    FROM
        `OM_CMN_STG_BSSite`
    WHERE
        processId <> p_processId AND isCommenced = 1
) SIT2
ON
    SIT1.USRN = SIT2.USRN AND SIT1.processId = p_processId AND(
        SIT1.errorDetails NOT LIKE('%IS NULL%') OR SIT1.errorDetails IS NULL OR SIT1.errorDetails = ''
    )
SET
    SIT1.errorDetails = OM_CMN_FUNC_ConcatenateString(
        SIT1.errorDetails,
        'An order with same USRN has been already queued up for commencement of planning handover. Please raise a service request on USRN to get more information.'
    )
WHERE
    SIT1.USRN = SIT2.USRN AND SIT1.processId = p_processId AND(
        SIT1.errorDetails NOT LIKE('%IS NULL%') OR SIT1.errorDetails IS NULL OR SIT1.errorDetails = ''
    );



UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'This site record is under progress, please review.'
    )
WHERE
    processId = p_processId AND LOCATE('Order in progress', `errorDetails`) = 0 AND
	USRN IN (SELECT QRY.`USRN` FROM (SELECT `USRN`,COUNT(ID) CNT FROM `OM_CMN_STG_BSSite` WHERE `processId` <> p_processId AND `isCommenced` = 1 GROUP BY `USRN`) QRY WHERE QRY.CNT>1);

COMMIT;
SET
    p_isError = 0 ;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_WriteSFCApplication;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_WriteSFCApplication`(IN `p_processId` INT, IN `p_appPrefix` VARCHAR(10), IN `p_itemSubTypeRefId` INT, OUT `p_sfcAction` VARCHAR(25))
BEGIN

   DECLARE correlationId_v VARCHAR(100);
        DECLARE sfStatus_v VARCHAR(100);
        DECLARE fibreBuildCategory_v VARCHAR(100);
		DECLARE lockId_v INT(11);

START TRANSACTION;

	-- Set audit

SET @updatedOnDTime = NOW();
 SELECT
        app.correlationId
    INTO correlationId_v
FROM
    `OM_CMN_Application` AS app
RIGHT JOIN OM_CMN_STG_SFC AS sfc
ON
    sfc.correlationId = app.correlationId
WHERE
    sfc.processId = p_processId ;
SELECT
    sfStatus
INTO sfStatus_v
FROM
    OM_CMN_STG_SFC
WHERE
    processId = p_processId ;
SELECT
    fibreBuildCategory
INTO fibreBuildCategory_v
FROM
    OM_CMN_STG_SFC
WHERE
    processId = p_processId ;
SELECT
    l.id
INTO lockId_v
FROM
    OM_CMN_Lock AS l
RIGHT JOIN OM_CMN_STG_SFC AS sfc
ON
    sfc.correlationId = l.uniqueId
WHERE
    sfc.processId = p_processId ;


IF lockId_v IS NULL THEN

INSERT INTO `OM_CMN_Lock`
(`entityTypeId`,`uniqueId`,`entityId`,`createdBy`,`createdOnDTime`)
Select 1,correlationId,p_processId,'EE Saleforce System',@updatedOnDTime from OM_CMN_STG_SFC where processId= p_processId;

IF sfStatus_v ='IN PROGRESS' and fibreBuildCategory_v ='C' and correlationId_v IS NOT NULL THEN





  UPDATE OM_CMN_Application AS app
 INNER JOIN OM_CMN_Application as app2 ON app.id = app2.id right join OM_CMN_STG_SFC AS sfc on sfc.correlationId=app2.correlationId
 SET app.statusId =  2, app.updatedBy='EE Saleforce System', app.updatedOnDTime=@updatedOnDTime
 where app.correlationId  = sfc.correlationId and sfc.processId=p_processId;




   UPDATE OM_CMN_APP_ServiceFeasibilityCosting AS appsfc
   Left Join
   OM_CMN_Application as app on appsfc.salesforceOppId = app.correlationId left join OM_CMN_STG_SFC as sfc on app.correlationId=sfc.correlationId
 SET appsfc.statusId =  app.statusId , appsfc.updatedOnDTime=@updatedOnDTime
 where app.correlationId  = sfc.correlationId and sfc.processId=p_processId;



 SET p_sfcAction = "GENERATE TASK";

 SELECT *
 FROM OM_CMN_Application as app  right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT appSfc.id,appSfc.applicationItemId,appSfc.statusId,appSfc.salesforceOppId,appSfc.salesforceQuoteName,appSfc.salesforceQuoteId,appSfc.salesforceParentOppId,appSfc.salesforceOppName,appSfc.salesforceParentOppName,appSfc.fibreBuildCategory,appSfc.address FROM OM_CMN_APP_ServiceFeasibilityCosting as appSfc right join OM_CMN_STG_SFC as sfc on sfc.correlationId=appSfc.salesforceOppId where sfc.processId=p_processId ;

 SELECT loc.id,loc.locId,loc.longitude,loc.latitude FROM OM_CMN_Location  as loc right join OM_CMN_Application as app on app.locationId=loc.id right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT fibre.id,fibre.itemId,fibre.recordTypeRefId,fibre.fibreJointId,fibre.fibreJointStatus,fibre.fibreJointTypeCode,fibre.fibreJointTypeDescription,fibre.fibreJointLatLong,fibre.loSDistance,fibre.createdOnDTime FROM OM_CMN_FibreJoint as fibre right join OM_CMN_ApplicationItem  as item on item.id = fibre.itemId right join OM_CMN_Application as app on app.id=item.applicationId right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 DELETE FROM OM_CMN_Lock where entityId = p_processId;

ELSE IF correlationId_v IS NULL THEN



	-- Insert Location


INSERT INTO `OM_CMN_Location`
( `locId`, `longitude`,  `latitude`,`updatedOnDTime`,`createdOnDTime`)
select locId, longitude,latitude,@updatedOnDTime,@updatedOnDTime from OM_CMN_STG_SFC where processId= p_processId;


	-- Insert Application
INSERT INTO `OM_CMN_Application`
(`correlationId`,`correlationName`, `statusId`, `locationId`,`expectedCompletionDate`,`applicationDate`,`createdBy`,`updatedOnDTime`,`updatedBy`)

select
 sfc.correlationId ,sfc.sfOppName,  if(fibreBuildCategory_v='A',4,if(sfStatus_v='PENDING',1,if(sfStatus_v='IN PROGRESS',2,4))) ,loc.id,DATE_ADD(@updatedOnDTime, INTERVAL 7 DAY),@updatedOnDTime,'EE Saleforce System',@updatedOnDTime,'EE Saleforce System'  from OM_CMN_STG_SFC sfc left join OM_CMN_Location loc on sfc.locId=loc.locId where processId= p_processId order by loc.id desc limit 1;

	-- Update ApplicationId

 UPDATE OM_CMN_Application AS app
 INNER JOIN OM_CMN_Application as app2 ON app.id = app2.id right join OM_CMN_STG_SFC AS sfc on sfc.correlationId=app2.correlationId
 SET app.omId =  concat(p_appPrefix,RIGHT(concat('000000000',app2.id),9))
 where app.correlationId  = sfc.correlationId and sfc.processId=p_processId;



	-- Insert  Application Item
 INSERT INTO OM_CMN_ApplicationItem
(`applicationId`,`recordTypeRefId`,`locationId`,`omId`,`mainLineItemFlag`,`itemSubTypeRefId`,`state`)
select app.id , 1,app.locationId,app.omId,1,p_itemSubTypeRefId,'' from OM_CMN_Application AS app right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId= p_processId ;

	-- Insert SFC
 INSERT INTO `OM_CMN_APP_ServiceFeasibilityCosting`
( `applicationItemId`,`statusId`, `salesforceOppId`, `salesforceQuoteName`, `salesforceQuoteId`, `salesforceParentOppId`,`salesforceOppName`,`salesforceParentOppName`,`fibreBuildCategory`,`address`,`createdOnDTime`,`updatedOnDTime`)
select
 item.id, app.statusId, sfc.correlationId, sfc.sfQuoteName,sfc.sfQuoteId,sfc.sfParentOppId,sfc.sfOppName,sfc.sfParentOppName,sfc.fibreBuildCategory,sfc.address,@updatedOnDTime,@updatedOnDTime  from
 OM_CMN_ApplicationItem as item left join OM_CMN_Application as app on item.applicationId = app.id left join OM_CMN_STG_SFC as sfc on app.correlationId=sfc.correlationId where sfc.processId=p_processId;


 	-- Insert FibreJoint
 INSERT INTO `OM_CMN_FibreJoint`
( `itemId`, `recordTypeRefId`, `fibreJointId`, `fibreJointStatus`, `fibreJointTypeCode`,`fibreJointLatLong`,`loSDistance`,`createdOnDTime`,`updatedOnDTime`)

select item.id, 1, sfc.fibreJointId,sfc.fibreJointStatus,sfc.fibreJointTypeCode,sfc.fibreJointLatLong,sfc.actualDistance, @updatedOnDTime, @updatedOnDTime from
 OM_CMN_ApplicationItem as item left join OM_CMN_Application as app on item.applicationId = app.id left join OM_CMN_STG_SFC as sfc on app.correlationId=sfc.correlationId where sfc.processId=p_processId;



SET p_sfcAction = if(fibreBuildCategory_v='B',"GENERATE TASK","RECORD CREATED");

SELECT *
 FROM OM_CMN_Application as app  right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT appSfc.id,appSfc.applicationItemId,appSfc.statusId,appSfc.salesforceOppId,appSfc.salesforceQuoteName,appSfc.salesforceQuoteId,appSfc.salesforceParentOppId,appSfc.salesforceOppName,appSfc.salesforceParentOppName,appSfc.fibreBuildCategory,appSfc.address FROM OM_CMN_APP_ServiceFeasibilityCosting as appSfc right join OM_CMN_STG_SFC as sfc on sfc.correlationId=appSfc.salesforceOppId where sfc.processId=p_processId ;

 SELECT loc.id,loc.locId,loc.longitude,loc.latitude FROM OM_CMN_Location  as loc right join OM_CMN_Application as app on app.locationId=loc.id right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT fibre.id,fibre.itemId,fibre.recordTypeRefId,fibre.fibreJointId,fibre.fibreJointStatus,fibre.fibreJointTypeCode,fibre.fibreJointTypeDescription,fibre.fibreJointLatLong,fibre.loSDistance,fibre.createdOnDTime FROM OM_CMN_FibreJoint as fibre right join OM_CMN_ApplicationItem  as item on item.id = fibre.itemId right join OM_CMN_Application as app on app.id=item.applicationId right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;



 DELETE FROM OM_CMN_Lock where entityId = p_processId;
  Delete  from OM_CMN_STG_SFC where processId= p_processId ;




 ELSE
 SET p_sfcAction = "REJECT RECORD";
  DELETE FROM OM_CMN_Lock where entityId = p_processId;
   Delete  from OM_CMN_STG_SFC where processId= p_processId ;


 END IF;
 END IF;


 ELSE
 SET p_sfcAction = "WAIT";
 END IF;


 	-- Empty Staging data

  COMMIT;

END$$
DELIMITER ;


-- 1907 EE Changed by Mani (fixed the not null issue for column Process Name)

DROP PROCEDURE IF EXISTS OM_CMN_SP_JSON_InsertServiceLog;
DELIMITER $$
CREATE PROCEDURE `OM_CMN_SP_JSON_InsertServiceLog`(IN `p_testCaseFlag` BOOLEAN, IN `p_requestJson` JSON, IN `p_serviceTypeId` INT, IN `p_outBoundFlag` BOOLEAN, IN `p_correlationId` VARCHAR(255), IN `p_processName` VARCHAR(255))
BEGIN
	/*
	inserts a new entry into OM_CMN_ServiceLog and returns the id inserted

	handles insert of the full request body as a json type

	will also attempt to extract the requestId in the body for the retry pattern to work

	INPUT:
		p_requestJson: the full body of the request as json

	OUTPUT:
		id of the inserted row into OM_CMN_ServiceLog,
		requestId

	TEST CALLS:


	call OM_CMN_SP_JSON_InsertServiceLog(true,"abc");  -- causes json parse error
	call OM_CMN_SP_JSON_InsertServiceLog(true,null,-1);
	call OM_CMN_SP_JSON_InsertServiceLog(true,null,1);
	call OM_CMN_SP_JSON_InsertServiceLog(TRUE,"{\"sample\":\"test\"}");
	call OM_CMN_SP_JSON_InsertServiceLog(FALSE,"{\"requestId\":\"FALSE1224-bd59-11e8-be02-0a08166ca660\"}");
	call OM_CMN_SP_JSON_InsertServiceLog(TRUE,"{\"requestId\":\"TRUE1224-bd59-11e8-be02-0a08166ca660\"}");
	*/
	DECLARE p_requestId VARCHAR(36);
	DECLARE p_id INT;

	START TRANSACTION;

	-- try to extract the requestId, not all requests will have this and will set to NULL if not found
	-- NOTE: requestId MUST be there if implementing the retry pattern with the request

	IF 	p_outBoundFlag = TRUE THEN
		SELECT
		 CASE
			  WHEN p_serviceTypeId = 4  THEN   JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.serviceOrder.requestId'))
			  ELSE  JSON_UNQUOTE(JSON_EXTRACT(p_requestJson,'$.requestId'))
		 END INTO p_requestId;
	END IF;


		INSERT INTO
			OM_CMN_ServiceLog
		(
			requestId,
			requestJson,
			testCaseFlag,
			correlationId,
			serviceTypeId,
			notificationType,
            processName
		)
		VALUES (
			p_requestId,
			p_requestJson,
			p_testCaseFlag,
			p_correlationId,
			CASE WHEN p_serviceTypeId = -1 THEN NULL ELSE p_serviceTypeId END,
			" "," "
		);

	SELECT LAST_INSERT_ID() INTO p_id;

	-- fetch and save the ID used above to return to the caller, we should have all the values we require to send back without making a SELECT call
	SELECT
		p_id AS 'id',
		p_requestId AS 'requestId',
		CASE WHEN p_serviceTypeId = -1 THEN NULL ELSE p_serviceTypeId END AS 'serviceTypeId';
	COMMIT;


  END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS  OM_CMN_SP_UpdateSOMConfigResponse;
DELIMITER $$
CREATE  PROCEDURE `OM_CMN_SP_UpdateSOMConfigResponse`(IN `p_ovcDisplayId` VARCHAR(255), IN `p_orderId` INT)
BEGIN
DECLARE p_ovcCount INT;
START TRANSACTION;


SET @updatedOnDTime = NOW();
SET @updatedBy = 'SOM Config System';



UPDATE OM_CMN_OVC
SET OM_CMN_OVC.ovcConfiguredFlag=1, OM_CMN_OVC.updatedBy= @updatedBy, OM_CMN_OVC.updatedOnDTime= @updatedOnDTime where
  OM_CMN_OVC.itemId in ( SELECT OM_CMN_OrderItem.id from OM_CMN_OrderItem where OM_CMN_OrderItem.omId = p_ovcDisplayId and OM_CMN_OrderItem.itemSubTypeRefId=4) ;



Select count(OM_CMN_OVCConfigure_View.ovcId) from OM_CMN_OVCConfigure_View where OM_CMN_OVCConfigure_View.orderId=p_orderId and OM_CMN_OVCConfigure_View.ovcConfiguredFlag is null into p_ovcCount;


IF p_ovcCount = 0 THEN
UPDATE `OM_CMN_ProcessDecision` SET `decisionFlag` = 1 WHERE `OM_CMN_ProcessDecision`.`orderId` = p_orderId and `OM_CMN_ProcessDecision`.`name`='serviceConfigCompleted' ;

 END IF;



IF p_ovcCount = 0 THEN

INSERT INTO `OM_CMN_Audit`
(`recordTypeRefId`, `recordId`, `actionName`, `buttonAction`, `description`, `createdBy`, `createdOnDTime`, `auditTypeRefId`) VALUES
( 1,p_orderId,'SOM Configured', 'Complete', p_ovcDisplayId, @updatedBy, @updatedOnDTime,1);
 END IF;




Select * from `OM_CMN_ProcessDecision` where `OM_CMN_ProcessDecision`.`orderId` = p_orderId ;

END$$
DELIMITER ;
DROP PROCEDURE IF EXISTS `OM_CMN_SP_JSON_ParseProductOrder`;
DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_JSON_ParseProductOrder`(IN `p_opo` JSON, IN `p_processId` INT(11), IN `p_deleteStagingTablesFlag` TINYINT(1), IN `p_folderId` INT(11), IN `p_accessSeekerId` VARCHAR(100), IN `p_orderTypeRefId` INT(11), IN `p_recordTypeRefId` INT(11), IN `p_productName` VARCHAR(255), IN `p_correlationId` VARCHAR(255), IN `p_updatedBy` VARCHAR(255), IN `p_initialStatusId` INT(11), IN `p_itemSubTypeRefId_EE` INT(11), IN `p_itemSubTypeRefId_BTD` INT(11), IN `p_itemSubTypeRefId_UNI` INT(11), IN `p_itemSubTypeRefId_OVC` INT(11), IN `p_productHeaderId` INT(11), IN `p_isTestCaseFlag` TINYINT(1), IN `p_locationId` INT(11), IN `p_afterHoursFlagNotSelected` INT(1), IN `p_afterHoursFlagSelected` INT(1))
    COMMENT 'Ben debugging issues on 2018-12-19'
BEGIN
	declare jsonOrder_v json;
	declare itemInvolvesProduct_v json;
	declare accessSeekerInteraction_v json;
	declare accessSeekerContact_v json;
	declare stgOrderId INT;
	declare p_orderId INT;
	declare p_btdId INT;
	declare p_uniId INT;
	declare p_accessSeekerContactId INT;
	declare p_statusVersionId INT;
	declare p_itemRefName VARCHAR(255);
	declare p_orderType VARCHAR(255);

	START TRANSACTION;
		INSERT INTO
			OM_CMN_STG_Order
		(
			opo,
			processId,
			appianFolderId,
			statusId,
			productHeaderId,
			orderTypeRefId,
			updatedBy,
			createdBy
		)
		VALUES (
			p_opo,
			p_processId,
			p_folderId,
			p_initialStatusId,
			p_productHeaderId,
			p_orderTypeRefId,
			p_updatedBy,
			p_updatedBy
		);

		select LAST_INSERT_ID() INTO stgOrderId;

		select
		opo->>'$.eventBody.productOrder'
		INTO
		jsonOrder_v from OM_CMN_STG_Order
		 WHERE id = stgOrderId;

		select
		opo->>'$.eventBody.productOrder.productOrderComprisedOf.itemInvolvesProduct'
		INTO
		itemInvolvesProduct_v from OM_CMN_STG_Order
		 WHERE id = stgOrderId;


		select
		opo->>'$.eventBody.productOrder.accessSeekerInteraction'
		INTO
		accessSeekerInteraction_v from OM_CMN_STG_Order
		 WHERE id = stgOrderId;

		select
		opo->>'$.eventBody.productOrder.accessSeekerContact'
		INTO
		accessSeekerContact_v from OM_CMN_STG_Order
		 WHERE id = stgOrderId;

		 select
		opo->>'$.eventBody.productOrder.orderType'
		INTO
		p_orderType from OM_CMN_STG_Order
		 WHERE id = stgOrderId;

		INSERT INTO
			OM_CMN_STG_EnterpriseEthernet
		(
			processId,recordTypeRefId,itemId,action,`billingAccountId`, `afterHoursAppointment`, `inductionRequired`, `securityClearance`, `notes`, `tradingName`, `heritageSite`,`csaId`,`term`, `serviceRestorationSLA`, `accessAvailabilityTarget`, `zone`, `productType`, `templateId`, `templateVersion`,`createdOnDTime`,`createdBy`
		)
		VALUES
		(
			p_processId,
			p_recordTypeRefId,
			1,
			jsonOrder_v ->>'$.productOrderComprisedOf.action',
			accessSeekerInteraction_v->>'$.billingAccountID',
			jsonOrder_v ->>'$.afterHoursAppointment',
			jsonOrder_v ->>'$.inductionRequired',
			jsonOrder_v ->>'$.securityClearance',
			CASE WHEN jsonOrder_v ->>'$.notes'  ='null' THEN null ELSE jsonOrder_v ->>'$.notes' END,
            CASE WHEN jsonOrder_v ->>'$.tradingName' ='null' THEN null ELSE jsonOrder_v ->>'$.tradingName' END,
			jsonOrder_v ->>'$.heritageSite',
			jsonOrder_v ->>'$.csaId',
			itemInvolvesProduct_v ->>'$.term',
			itemInvolvesProduct_v ->>'$.serviceRestorationSLA',
			itemInvolvesProduct_v ->>'$.accessAvailabilityTarget',
			itemInvolvesProduct_v ->>'$.zone',
			itemInvolvesProduct_v ->>'$.productType',
			itemInvolvesProduct_v ->>'$.templateId',
			itemInvolvesProduct_v ->>'$.templateVersion',
			now(),
			'Salesforce'
		);

		INSERT INTO
			OM_CMN_STG_AccessSeekerContact
		(
			processId,`contactName`, `contactPhone`,`createdOnDTime`,`createdBy`
		)
		VALUES
		(p_processId, accessSeekerContact_v->>'$.contactName',accessSeekerContact_v ->>'$.contactPhone',now(),'Salesforce');

		INSERT INTO
			OM_CMN_STG_Contact
		(
			`processId`,idx,`type`, `contactName`, `role`, `emailAddress`, `phoneNumber`, `addressLine1`, `addressLine2`, `addressLine3`, `localityName`, `postcode`, `stateTerritoryCode`,`createdOnDTime`,`createdBy`
		)
		SELECT
		  p_processId,
		  idx,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].type')))) AS type,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].contactName')))) AS contactName,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].role')))) AS role,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].emailAddress')))) AS emailAddress,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].phoneNumber')))) AS phoneNumber,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].unstructuredAddress.addressLine1')))) AS addressLine1,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].unstructuredAddress.addressLine2')))) AS addressLine2,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].unstructuredAddress.addressLine3')))) AS addressLine3,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].unstructuredAddress.localityName')))) AS localityName,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].unstructuredAddress.postcode')))) AS postcode,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, '].unstructuredAddress.stateTerritoryCode')))) AS stateTerritoryCode,
		  now() AS createdOnDTime ,
		  'Salesforce' AS createdBy

		FROM OM_CMN_STG_Order j

		INNER JOIN
			OM_CMN_R_Index indexes
		WHERE
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.itemInvolvesContact[', idx, ']')) IS NOT NULL
		AND
			j.id = stgOrderId;


		INSERT INTO
			OM_CMN_STG_BTD
		(
			`processId`,idx,action, `btdType`, `btdMounting`, `powerSupply1`, `powerSupply2`,`omId`,`createdOnDTime`,`createdBy`
		)
		SELECT
		  p_processId,
		  idx,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].action')))) AS action,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.btdType')))) AS btdType,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.btdMounting')))) AS btdMounting,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.powerSupply1')))) AS powerSupply1,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.powerSupply2')))) AS powerSupply2,
		 OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.id')))) AS omId,
		  now() AS createdOnDTime ,
		  'Salesforce' AS createdBy
		FROM OM_CMN_STG_Order j

		INNER JOIN
			OM_CMN_R_Index indexes
		WHERE
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, ']')) IS NOT NULL
		AND
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.type')) = 'BTD'
		AND
			j.id = stgOrderId;

		INSERT INTO
			OM_CMN_STG_OVC
		(
			`processId`,idx,action,`poi`, `nni`, `routeType`, `sVLanId`, `maximumFrameSize`, `cosHighBandwidth`, `cosMediumBandwidth`,
			`cosLowBandwidth`, `uniVLanId`, `cosMappingMode`,`connectedTo`,`omId`,`ovcTransientId`,`createdOnDTime`,`createdBy`
		)
		SELECT
		  p_processId,
		  idx,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].action')))) AS action,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.poi')))) AS poi,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.nni')))) AS nni,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.routeType')))) AS routeType,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.sVLanId')))) AS sVLanId,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.maximumFrameSize')))) AS maximumFrameSize,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.cosHighBandwidth')))) AS cosHighBandwidth,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.cosMediumBandwidth')))) AS cosMediumBandwidth,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.cosLowBandwidth')))) AS cosLowBandwidth,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.uniVLanId')))) AS uniVLanId,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.cosMappingMode')))) AS cosMappingMode,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.connectedTo')))) AS connectedTo,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.id')))) AS omId,
		  OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.ovcTransientId')))) AS ovcTransientId,
		  now() AS createdOnDTime ,
		  'Salesforce' AS createdBy

		FROM OM_CMN_STG_Order j

		INNER JOIN
			OM_CMN_R_Index indexes
		WHERE
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, ']')) IS NOT NULL
		AND
			j.id = stgOrderId
		AND
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx, '].itemInvolvesProduct.type')) = 'OVC';


		INSERT INTO
			OM_CMN_STG_UNI
		(
			processId,idx1,idx2,action,`interfaceBandwidth`, `portId`, `interfaceType`, `ovcType`, `tpId`, `transientId`,`omId`,`createdOnDTime`,`createdBy`
		)
		SELECT
			p_processId,
			idx1.idx,
			idx2.idx,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].action')))) AS action,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.interfaceBandwidth')))) AS interfaceBandwidth,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.portId')))) AS portId,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.interfaceType'))))AS interfaceType,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.ovcType')))) AS ovcType,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.tpId')))) AS tpId,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.transientId')))) AS transientId,
			OM_CMN_ParseJsonField(JSON_UNQUOTE(JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.id')))) AS omId,
		  now() AS createdOnDTime ,
		  'Salesforce' AS createdBy
		FROM
			OM_CMN_STG_Order j
		INNER JOIN
			OM_CMN_R_Index idx1
		INNER JOIN
			OM_CMN_R_Index idx2
		WHERE
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, ']')) is not null
		AND
			j.id = stgOrderId
		AND
			JSON_EXTRACT(j.opo, CONCAT('$.eventBody.productOrder.productOrderComprisedOf.referencesProductOrderItem[', idx1.idx, '].referencesProductOrderItem[', idx2.idx, '].itemInvolvesProduct.type')) = 'UNI';


		SELECT OM_CMN_FUNC_GetLatestStatusVersionId(p_itemSubTypeRefId_EE,jsonOrder_v ->>'$.orderType',p_orderTypeRefId,CASE WHEN jsonOrder_v ->>'$.orderType' = 'Connect' THEN 'Network Augmentation Required' ELSE 'No Shortfall' END ) INTO p_statusVersionId;

		-- UPDATE existing STG ORDER with additional values
		UPDATE
			OM_CMN_STG_Order o
		LEFT JOIN
			OM_CMN_ApplicationLocation_View app
		ON
			app.correlationId = p_correlationId
		INNER JOIN
			OM_CMN_R_StatusVersionRef version
		ON
			version.id = p_statusVersionId
		SET
			o.accessSeekerId = p_accessSeekerId,
			o.requestedCompletionDate = CASE WHEN jsonOrder_v ->>'$.customerRequiredDate' = 'null' THEN NULL ELSE jsonOrder_v ->>'$.customerRequiredDate' END,
			o.applicationId = app.id,
			o.correlationId = p_correlationId,

			o.correlationName =
			CASE WHEN
				jsonOrder_v ->>'$.associatedReferenceId' IS NULL

			OR
				jsonOrder_v ->>'$.associatedReferenceId' = 'null'
			THEN app.correlationName ELSE jsonOrder_v ->>'$.associatedReferenceId' END,
			o.locationId = app.locationId,
			o.name = p_productName,
			o.orderType=jsonOrder_v ->>'$.orderType',
			o.orderTypeRefId = p_orderTypeRefId,
			o.orderdate = NOW(),
			-- priority = *****,
			o.updatedOnDTime = NOW(),

			o.priId = itemInvolvesProduct_v ->>'$.id',
			o.statusVersionId = p_statusVersionId,
			-- BH added on 21-Dec-18 to allow correct setting of status version under the COM ROM Routing - New sub process models which calls DF_RULE_GetNextProcessForProductWrapper
			o.shortfallType = version.shortfallType
		WHERE
			o.id = stgOrderId;

		-- OM_CMN_AccessSeekerContact
		INSERT INTO
			OM_CMN_AccessSeekerContact
		(
			createdBy,`contactName`, `contactPhone`
		)
		SELECT
			p_updatedBy, contactName, contactPhone
		FROM
			OM_CMN_STG_AccessSeekerContact
		WHERE
			processId = p_processId;

		SELECT LAST_INSERT_ID() INTO p_accessSeekerContactId;
		-- Jaggu - Update locationId for modify Order

		IF p_orderType = 'Modify' THEN
		UPDATE `OM_CMN_STG_Order` SET `locationId` = p_locationId WHERE `OM_CMN_STG_Order`.`id` = stgOrderId;
		END IF;
	 -- Update afterHoursProcessing for Modify Order - Mani
	  IF p_orderType = 'Modify' THEN
		UPDATE `OM_CMN_STG_Order` SET `afterHoursProcessing` = CASE WHEN jsonOrder_v ->>'$.afterHoursProcessing'  ='null' THEN null
		ELSE
		CASE WHEN jsonOrder_v ->>'$.afterHoursProcessing'  = 'Yes' THEN p_afterHoursFlagSelected ELSE
		CASE WHEN jsonOrder_v ->>'$.afterHoursProcessing'  = 'No' THEN p_afterHoursFlagNotSelected ELSE null END
		END
		END
		WHERE `OM_CMN_STG_Order`.`id` = stgOrderId;
		END IF;
		-- OM_CMN_Order
		INSERT INTO
			OM_CMN_Order
		(
			`omId`, productHeaderId,`accessSeekerContactId`,`correlationId`, `correlationName`, `appianFolderId`, statusVersionId, `statusId`, `substatusId`, `locationId`, `orderTypeRefId`, `state`, `name`, `description`, `priority`, `orderDate`, `expectedCompletionDate`, `completionDate`, `requestedStartDate`, `requestedCompletionDate`, `updatedBy`, `createdBy`, `updatedOnDTime`, `priId`, `orderType`, `applicationId`, `accessSeekerId`, `pendFlag`, `opoAppianDocId`, `npdStatusId`, `npdSubstatusId`, `sendNotificationsFlag`, `finalStatusCompletedFlag`, `parentOrderId`, `subprocessPendFlag`,`opo`,`itemSubTypeRefId`, deleteFlag, shortfallType,`afterHoursProcessing`
		)
		SELECT
			`omId`, p_productHeaderId, p_accessSeekerContactId,`correlationId`, `correlationName`, `appianFolderId`, statusVersionId, `statusId`, `substatusId`, `locationId`, `orderTypeRefId`, `state`, `name`, `description`, `priority`, `orderDate`, `expectedCompletionDate`, `completionDate`, `requestedStartDate`, `requestedCompletionDate`, `updatedBy`, `createdBy`, `updatedOnDTime`, priId, `orderType`, `applicationId`, `accessSeekerId`, `pendFlag`, `opoAppianDocId`, `npdStatusId`, `npdSubstatusId`, `sendNotificationsFlag`, `finalStatusCompletedFlag`, `parentOrderId`, `subprocessPendFlag`, `opo`,p_itemSubTypeRefId_EE, p_isTestCaseFlag, shortfallType,`afterHoursProcessing`
		FROM
			OM_CMN_STG_Order
		WHERE
			id = stgOrderId;

		SELECT LAST_INSERT_ID() INTO p_orderId;

		-- INSERT INTO OM_CMN_STG_OrderItem for BTD, UNI, OVC

		INSERT INTO
			OM_CMN_STG_OrderItem
		(
			entityId,processId, orderId, idx, itemSubTypeRefId, recordTypeRefId, locationId, mainLineItemFlag, action,hideSummaryRowFlag,omId
		)
		SELECT
			1,e.processId, p_orderId, 0, p_itemSubTypeRefId_EE, p_recordTypeRefId, o.locationId, 1, e.action,true,null
		FROM
			OM_CMN_STG_EnterpriseEthernet e
		INNER JOIN
			OM_CMN_STG_Order o
		ON
			o.processId = e.processId
		WHERE
			e.processId = p_processId
		UNION SELECT ALL
			1,e.processId, p_orderId, 0, p_itemSubTypeRefId_BTD, p_recordTypeRefId, o.locationId, 0, e.action,false,e.omId
		FROM
			OM_CMN_STG_BTD e
		INNER JOIN
			OM_CMN_STG_Order o
		ON
			o.processId = e.processId
		WHERE
			e.processId = p_processId
		UNION SELECT ALL
			1,e.processId, p_orderId, 0, p_itemSubTypeRefId_UNI, p_recordTypeRefId, o.locationId, 0, e.action,false,e.omId
		FROM
			OM_CMN_STG_UNI e
		INNER JOIN
			OM_CMN_STG_Order o
		ON
			o.processId = e.processId
		WHERE
			e.processId = p_processId
		UNION SELECT ALL
			1,e.processId, p_orderId, idx, p_itemSubTypeRefId_OVC, p_recordTypeRefId, o.locationId, 0, e.action,false,e.omId
		FROM
			OM_CMN_STG_OVC e
		INNER JOIN
			OM_CMN_STG_Order o
		ON
			o.processId = e.processId
		WHERE
			e.processId = p_processId;

		-- OM_CMN_OrderItem
		INSERT INTO
			OM_CMN_OrderItem
		(
			`entityId`,`orderId`, idx, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, `mainLineItemFlag`, `action`, `state`, `priority`, `completionDate`, `expectedCompletionDate`, `requestedCompletionDate`, `requestedStartDate`, hideSummaryRowFlag
		)
		SELECT
			`entityId`,`orderId`, idx, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `parentOrderItemId`, `omId`, `mainLineItemFlag`, `action`, `state`, `priority`, `completionDate`, `expectedCompletionDate`, `requestedCompletionDate`, `requestedStartDate`, hideSummaryRowFlag
		FROM
			OM_CMN_STG_OrderItem
		WHERE
			processId = p_processId;

		-- OM_CMN_EnterpriseEthernet
		INSERT INTO
			OM_CMN_EnterpriseEthernet
		(
			itemId,`recordTypeRefId`, itemSubTypeRefId, `billingAccountId`, `afterHoursAppointment`, `inductionRequired`, `securityClearance`, `notes`, `tradingName`, `heritageSite`, `term`, `serviceRestorationSLA`, `accessAvailabilityTarget`, `zone`, `productType`, `templateId`, `templateVersion`, `npdRequiredFlag`, `orderAcceptedFlag`, `designAssignCompletedFlag`, `csaId`
		)
		SELECT
			item.id, ee.recordTypeRefId, item.itemSubTypeRefId, ee.billingAccountId, ee.afterHoursAppointment, ee.inductionRequired, ee.securityClearance, ee.notes, ee.tradingName, ee.heritageSite, ee.term, ee.serviceRestorationSLA, ee.accessAvailabilityTarget, ee.zone, ee.productType, ee.templateId, ee.templateVersion, ee.npdRequiredFlag, ee.orderAcceptedFlag, ee.designAssignCompletedFlag, ee.csaId
		FROM
			OM_CMN_STG_EnterpriseEthernet ee
		INNER JOIN
			OM_CMN_OrderItem item
		ON
			item.orderId = p_orderId
		AND
			item.itemSubTypeRefId = p_itemSubTypeRefId_EE
		WHERE
			ee.processId = p_processId;

		-- OM_CMN_BTD


		INSERT INTO
			OM_CMN_BTD
		(
			itemId,recordTypeRefId, itemSubTypeRefId, `btdType`, `btdMounting`, `powerSupply1`, `powerSupply2`, `physicalName`
		)
		SELECT
			item.id, item.recordTypeRefId, item.itemSubTypeRefId, `btdType`, `btdMounting`, `powerSupply1`, `powerSupply2`, `physicalName`
		FROM
			OM_CMN_STG_BTD entity
		INNER JOIN
			OM_CMN_OrderItem item
		ON
			item.orderId = p_orderId
		AND
			item.itemSubTypeRefId = p_itemSubTypeRefId_BTD
		WHERE
			entity.processId = p_processId;

		SELECT LAST_INSERT_ID() INTO p_btdId;

		-- OM_CMN_UNI

		INSERT INTO
			OM_CMN_UNI
		(
			`btdId`, `itemId`, `recordTypeRefId`,itemSubTypeRefId, `interfaceBandwidth`, `portId`, `interfaceType`, `ovcType`, `tpId`, `transientId`
		)
		SELECT
			p_btdId, item.id, item.recordTypeRefId, item.itemSubTypeRefId,`interfaceBandwidth`, `portId`, `interfaceType`, `ovcType`, `tpId`, `transientId`
		FROM
			OM_CMN_STG_UNI entity
		INNER JOIN
			OM_CMN_OrderItem item
		ON
			item.orderId = p_orderId
		AND
			item.itemSubTypeRefId = p_itemSubTypeRefId_UNI
		WHERE
			entity.processId = p_processId;

		SELECT LAST_INSERT_ID() INTO p_UniId;

		-- OM_CMN_OVC


		INSERT INTO
			OM_CMN_OVC
		(
			`uniId`, `recordTypeRefId`, itemSubTypeRefId, itemId,idx, `poi`, `nni`, `routeType`, `sVLanId`, `maximumFrameSize`, `cosHighBandwidth`, `cosMediumBandwidth`, `cosLowBandwidth`, `uniVLanId`, `connectedTo`, `enniLagId`, `ovcTransientId`, `cncId`, `cosMappingMode`
		)
		SELECT
			p_UniId, item.recordTypeRefId, item.itemSubTypeRefId,item.id, entity.idx, `poi`, `nni`, `routeType`, `sVLanId`, `maximumFrameSize`, `cosHighBandwidth`, `cosMediumBandwidth`, `cosLowBandwidth`, `uniVLanId`, `connectedTo`, `enniLagId`, `ovcTransientId`, `cncId`, `cosMappingMode`
		FROM
			OM_CMN_STG_OVC entity
		INNER JOIN
			OM_CMN_OrderItem item
		ON
			item.orderId = p_orderId
		AND
			item.itemSubTypeRefId = p_itemSubTypeRefId_OVC
		AND
			item.idx = entity.idx
		WHERE
			entity.processId = p_processId;

		UPDATE
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_EnterpriseEthernet entity
		ON
			entity.itemId = item.id
		SET
			item.entityId = entity.id
		WHERE
			item.orderId = p_orderId;

		UPDATE
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_BTD entity
		ON
			entity.itemId = item.id
		SET
			item.entityId = entity.id
		WHERE
			item.orderId = p_orderId;

		UPDATE
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_UNI entity
		ON
			entity.itemId = item.id
		SET
			item.entityId = entity.id
		WHERE
			item.orderId = p_orderId;

		UPDATE
			OM_CMN_OrderItem item
		INNER JOIN
			OM_CMN_OVC entity
		ON
			entity.itemId = item.id
		SET
			item.entityId = entity.id
		WHERE
			item.orderId = p_orderId;

		-- INSERT INTO OM_CMN_Contact
		-- this joins onto the product in the OrderItem table
		INSERT INTO
			OM_CMN_Contact
		(
			`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `role`, `emailAddress`, `phoneNumber`, `addressLine1`, `addressLine2`, `addressLine3`, `localityName`, `postcode`, `stateTerritoryCode`
		)
		SELECT
			item.id, item.recordTypeRefId, p_updatedBy,`type`, `contactName`, `role`, `emailAddress`, `phoneNumber`, `addressLine1`, `addressLine2`, `addressLine3`, `localityName`, `postcode`, `stateTerritoryCode`
		FROM
			OM_CMN_STG_Contact entity
		INNER JOIN
			OM_CMN_OrderItem item
		ON
			item.orderId = p_orderId
		AND
			item.itemSubTypeRefId = p_itemSubTypeRefId_EE
		WHERE
			entity.processId = p_processId;


		INSERT INTO
			OM_CMN_OrderContactLink
		(
			contactId,
			orderItemId
		)
		SELECT
			entity.id,
			entity.itemId
		FROM
			OM_CMN_Contact entity
		INNER JOIN
			OM_CMN_OrderItem item
		ON
			entity.itemId = item.id
		AND
			item.orderId = p_orderId;

		IF p_deleteStagingTablesFlag = TRUE THEN
		DELETE FROM
			OM_CMN_STG_OVC
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_UNI
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_BTD
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_Contact
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_Order
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_EnterpriseEthernet
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_AccessSeekerContact
		WHERE
			processId = p_processId;

		DELETE FROM
			OM_CMN_STG_OrderItem
		WHERE
			processId = p_processId;
	END IF;



	SELECT OM_CMN_FUNC_GetOrderSubType(p_orderId, jsonOrder_v ->>'$.orderType') INTO p_itemRefName;

	UPDATE OM_CMN_Order SET orderSubType = p_itemRefName WHERE id = p_orderId;
	COMMIT;

	SELECT
		p_processId,
		id,
		parentOrderId,
		omId,
		statusVersionId,
		productHeaderId,
		correlationId,
		correlationName,
		appianFolderId,
		statusId,
		orderTypeRefId,
		state,
		name,
		description,
		priority,
		-- Appian requires the date/time value in a specific format when converting back using a!fromJson, hence we must use the specific format
		-- below which uses forward slashes
		OM_CMN_FormatDateTimeForJson(orderdate,0)  AS 'orderdate',
		OM_CMN_FormatDateTimeForJson(requestedCompletionDate,0)  AS 'requestedCompletionDate',
		updatedBy,
		createdBy,
		-- updatedOnDTime,
		priId,
		orderType,
        orderSubType,
		applicationId,
		accessSeekerContactId,
		accessSeekerId,
		substatusId,
		pendFlag,
		subprocessPendFlag,
		opoAppianDocId,
		locationId,
		npdStatusId,
		npdSubstatusId,
		sendNotificationsFlag,
		finalStatusCompletedFlag,
		-- createdOnDTime,
		itemSubTypeRefId,
		-- BH added on 21-Dec-18 to allow correct setting of status version under the COM ROM Routing - New sub process models which calls DF_RULE_GetNextProcessForProductWrapper
		shortfallType,afterHoursProcessing
	FROM
		OM_CMN_Order
	WHERE
		id = p_orderId;
  END$$
DELIMITER ;

DROP FUNCTION IF EXISTS OM_CMN_JSON_SCT_NotifyOrderPendHoldNote;

DELIMITER $$
CREATE DEFINER=`appian`@`%` FUNCTION `OM_CMN_JSON_SCT_NotifyOrderPendHoldNote`(`p_orderId` INT, `p_pendHoldId` INT, `p_isReasonCodeFlag` BOOLEAN) RETURNS json
BEGIN

  DECLARE note JSON;

  SET
	note =
	(
		SELECT
		CASE WHEN p_isReasonCodeFlag THEN
			JSON_OBJECT(
				'reasonCode',code,
				'reasonDescription',description
				)
		ELSE
			JSON_OBJECT(
				'id',code,
				'description',description
				)
		END
            FROM
                OM_CMN_PendHold_View
                    WHERE
                        id = p_pendHoldId
	);

	RETURN note;

  END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS OM_CMN_WriteSFCApplication;
DROP PROCEDURE IF EXISTS OM_CMN_SP_WriteSFCApplication;

DELIMITER $$
CREATE  PROCEDURE `OM_CMN_SP_WriteSFCApplication`(IN `p_processId` INT, IN `p_appPrefix` VARCHAR(10), IN `p_itemSubTypeRefId` INT, OUT `p_sfcAction` VARCHAR(25))
BEGIN

   DECLARE correlationId_v VARCHAR(100);
        DECLARE sfStatus_v VARCHAR(100);
        DECLARE fibreBuildCategory_v VARCHAR(100);

START TRANSACTION;

	-- Set audit

SET @updatedOnDTime = NOW();
 SELECT
        app.correlationId
    INTO correlationId_v
FROM
    `OM_CMN_Application` AS app
RIGHT JOIN OM_CMN_STG_SFC AS sfc
ON
    sfc.correlationId = app.correlationId
WHERE
    sfc.processId = p_processId ;
SELECT
    sfStatus
INTO sfStatus_v
FROM
    OM_CMN_STG_SFC
WHERE
    processId = p_processId ;
SELECT
    fibreBuildCategory
INTO fibreBuildCategory_v
FROM
    OM_CMN_STG_SFC
WHERE
    processId = p_processId ;





IF sfStatus_v ='IN PROGRESS' and fibreBuildCategory_v ='C' and correlationId_v IS NOT NULL THEN





  UPDATE OM_CMN_Application AS app
 INNER JOIN OM_CMN_Application as app2 ON app.id = app2.id right join OM_CMN_STG_SFC AS sfc on sfc.correlationId=app2.correlationId
 SET app.statusId =  2, app.updatedBy='EE Saleforce System', app.updatedOnDTime=@updatedOnDTime
 where app.correlationId  = sfc.correlationId and sfc.processId=p_processId;




   UPDATE OM_CMN_APP_ServiceFeasibilityCosting AS appsfc
   Left Join
   OM_CMN_Application as app on appsfc.salesforceOppId = app.correlationId left join OM_CMN_STG_SFC as sfc on app.correlationId=sfc.correlationId
 SET appsfc.statusId =  app.statusId , appsfc.updatedOnDTime=@updatedOnDTime
 where app.correlationId  = sfc.correlationId and sfc.processId=p_processId;



 SET p_sfcAction = "GENERATE TASK";

 SELECT *
 FROM OM_CMN_Application as app  right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT appSfc.id,appSfc.applicationItemId,appSfc.statusId,appSfc.salesforceOppId,appSfc.salesforceQuoteName,appSfc.salesforceQuoteId,appSfc.salesforceParentOppId,appSfc.salesforceOppName,appSfc.salesforceParentOppName,appSfc.fibreBuildCategory,appSfc.address FROM OM_CMN_APP_ServiceFeasibilityCosting as appSfc right join OM_CMN_STG_SFC as sfc on sfc.correlationId=appSfc.salesforceOppId where sfc.processId=p_processId ;

 SELECT loc.id,loc.locId,loc.longitude,loc.latitude FROM OM_CMN_Location  as loc right join OM_CMN_Application as app on app.locationId=loc.id right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT fibre.id,fibre.itemId,fibre.recordTypeRefId,fibre.fibreJointId,fibre.fibreJointStatus,fibre.fibreJointTypeCode,fibre.fibreJointTypeDescription,fibre.fibreJointLatLong,fibre.loSDistance,fibre.createdOnDTime FROM OM_CMN_FibreJoint as fibre right join OM_CMN_ApplicationItem  as item on item.id = fibre.itemId right join OM_CMN_Application as app on app.id=item.applicationId right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;


ELSE IF correlationId_v IS NULL THEN



	-- Insert Location


INSERT INTO `OM_CMN_Location`
( `locId`, `longitude`,  `latitude`,`updatedOnDTime`,`createdOnDTime`)
select locId, longitude,latitude,@updatedOnDTime,@updatedOnDTime from OM_CMN_STG_SFC where processId= p_processId;


	-- Insert Application
INSERT INTO `OM_CMN_Application`
(`correlationId`,`correlationName`, `statusId`, `locationId`,`expectedCompletionDate`,`applicationDate`,`createdBy`,`updatedOnDTime`,`updatedBy`)

select
 sfc.correlationId ,sfc.sfOppName,  if(fibreBuildCategory_v='A',4,if(sfStatus_v='PENDING',1,if(sfStatus_v='IN PROGRESS',2,4))) ,loc.id,DATE_ADD(@updatedOnDTime, INTERVAL 7 DAY),@updatedOnDTime,'EE Saleforce System',@updatedOnDTime,'EE Saleforce System'  from OM_CMN_STG_SFC sfc left join OM_CMN_Location loc on sfc.locId=loc.locId where processId= p_processId order by loc.id desc limit 1;

	-- Update ApplicationId

 UPDATE OM_CMN_Application AS app
 INNER JOIN OM_CMN_Application as app2 ON app.id = app2.id right join OM_CMN_STG_SFC AS sfc on sfc.correlationId=app2.correlationId
 SET app.omId =  concat(p_appPrefix,RIGHT(concat('000000000',app2.id),9))
 where app.correlationId  = sfc.correlationId and sfc.processId=p_processId;



	-- Insert  Application Item
 INSERT INTO OM_CMN_ApplicationItem
(`applicationId`,`recordTypeRefId`,`locationId`,`omId`,`mainLineItemFlag`,`itemSubTypeRefId`,`state`)
select app.id , 1,app.locationId,app.omId,1,p_itemSubTypeRefId,'' from OM_CMN_Application AS app right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId= p_processId ;

	-- Insert SFC
 INSERT INTO `OM_CMN_APP_ServiceFeasibilityCosting`
( `applicationItemId`,`statusId`, `salesforceOppId`, `salesforceQuoteName`, `salesforceQuoteId`, `salesforceParentOppId`,`salesforceOppName`,`salesforceParentOppName`,`fibreBuildCategory`,`address`,`createdOnDTime`,`updatedOnDTime`)
select
 item.id, app.statusId, sfc.correlationId, sfc.sfQuoteName,sfc.sfQuoteId,sfc.sfParentOppId,sfc.sfOppName,sfc.sfParentOppName,sfc.fibreBuildCategory,sfc.address,@updatedOnDTime,@updatedOnDTime  from
 OM_CMN_ApplicationItem as item left join OM_CMN_Application as app on item.applicationId = app.id left join OM_CMN_STG_SFC as sfc on app.correlationId=sfc.correlationId where sfc.processId=p_processId;


 	-- Insert FibreJoint
 INSERT INTO `OM_CMN_FibreJoint`
( `itemId`, `recordTypeRefId`, `fibreJointId`, `fibreJointStatus`, `fibreJointTypeCode`,`fibreJointLatLong`,`loSDistance`,`createdOnDTime`,`updatedOnDTime`)

select item.id, 1, sfc.fibreJointId,sfc.fibreJointStatus,sfc.fibreJointTypeCode,sfc.fibreJointLatLong,sfc.actualDistance, @updatedOnDTime, @updatedOnDTime from
 OM_CMN_ApplicationItem as item left join OM_CMN_Application as app on item.applicationId = app.id left join OM_CMN_STG_SFC as sfc on app.correlationId=sfc.correlationId where sfc.processId=p_processId;



SET p_sfcAction = if(fibreBuildCategory_v='B',"GENERATE TASK","RECORD CREATED");

SELECT *
 FROM OM_CMN_Application as app  right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT appSfc.id,appSfc.applicationItemId,appSfc.statusId,appSfc.salesforceOppId,appSfc.salesforceQuoteName,appSfc.salesforceQuoteId,appSfc.salesforceParentOppId,appSfc.salesforceOppName,appSfc.salesforceParentOppName,appSfc.fibreBuildCategory,appSfc.address FROM OM_CMN_APP_ServiceFeasibilityCosting as appSfc right join OM_CMN_STG_SFC as sfc on sfc.correlationId=appSfc.salesforceOppId where sfc.processId=p_processId ;

 SELECT loc.id,loc.locId,loc.longitude,loc.latitude FROM OM_CMN_Location  as loc right join OM_CMN_Application as app on app.locationId=loc.id right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;

 SELECT fibre.id,fibre.itemId,fibre.recordTypeRefId,fibre.fibreJointId,fibre.fibreJointStatus,fibre.fibreJointTypeCode,fibre.fibreJointTypeDescription,fibre.fibreJointLatLong,fibre.loSDistance,fibre.createdOnDTime FROM OM_CMN_FibreJoint as fibre right join OM_CMN_ApplicationItem  as item on item.id = fibre.itemId right join OM_CMN_Application as app on app.id=item.applicationId right join OM_CMN_STG_SFC as sfc on sfc.correlationId=app.correlationId where sfc.processId=p_processId;



  Delete  from OM_CMN_STG_SFC where processId= p_processId ;




 ELSE
 SET p_sfcAction = "REJECT RECORD";
   Delete  from OM_CMN_STG_SFC where processId= p_processId ;


 END IF;
 END IF;



 	-- Empty Staging data

  COMMIT;

END$$
DELIMITER ;

-- 1906 NPD
DROP PROCEDURE IF EXISTS `OM_CMN_SP_NS_ParseManualOrder`;

DELIMITER $$
CREATE DEFINER=`appian`@`%` PROCEDURE `OM_CMN_SP_NS_ParseManualOrder`(IN `p_stgBSSiteId` INT, IN `p_appianFolderId` INT, IN `p_createdBy` VARCHAR(255), IN `p_updatedBy` VARCHAR(255),
IN `p_processId` INT, IN `p_productName` VARCHAR(255), IN `p_initialStatusId` INT,
IN `p_itemSubTypeRefId_NS` INT, IN `p_itemSubTypeRefId_NTD` INT,
IN `p_isTestCaseFlag` BOOLEAN, IN `p_statusVersionId` INT, IN `p_accessSeekerId` VARCHAR(100),
 IN `p_orderTypeRefId` INT, IN `p_recordTypeRefId` INT, IN `p_orderType` VARCHAR(255),
 IN `p_itemSubTypeRefId_NPDPlanDesign` INT, IN `p_addressFullText` VARCHAR(255))
BEGIN

/* Declare Variables */

DECLARE p_accessSeekerContactId INT;
DECLARE p_orderId INT;
DECLARE p_productHeaderId INT;
DECLARE p_dealId VARCHAR(10);
DECLARE p_locationId INT;
DECLARE p_orderItemIdNS INT;
DECLARE p_orderItemIdNTD INT;
DECLARE p_statusVersionId INT;
DECLARE p_accessSeekerContact VARCHAR(255);
DECLARE p_businessContact VARCHAR(255);
DECLARE p_siteContact VARCHAR(255);
DECLARE p_secondarySiteContact VARCHAR(255);
DECLARE p_buildingMgntContact VARCHAR(255);
DECLARE p_buildingOwnerContact VARCHAR(255);
DECLARE p_clientHSEMgrContact VARCHAR(255);
DECLARE p_nsNPDPlanDesignId INT;
DECLARE p_orderItemIdNSNPD INT;
DECLARE p_stateText VARCHAR(255);


START TRANSACTION;

	-- Fetch State from `OM_CMN_STG_BSSite`

SELECT
				 `state` INTO p_stateText
			FROM
				`OM_CMN_STG_BSSite`
			WHERE
				id = p_stgBSSiteId
				AND
				processId = p_processId;


	-- Fetch Deal Reference Id from `OM_CMN_Deal`

SELECT
	D.`id` INTO p_dealId
FROM
	`OM_CMN_Deal` D JOIN  `OM_CMN_STG_BSSite` S
		ON
		(
			D.`dealName` = S.`dealName` and D.`RSP` = S.`RSP` and D.`customer` = S.`tradingName`
		)
WHERE
	S.`id` = p_stgBSSiteId
	AND
	S.`processId` = p_processId;

	-- `OM_CMN_ProductHeader`

INSERT INTO
	`OM_CMN_ProductHeader`
	(
		`activityName`, `msgName`, `businessServiceName`, `businessServiceVersion`, `businessChannel`, `msgType`, `security`, `communicationPattern`, `orderPriority`, `timestamp`, `createdOnDTime`, `updatedOnDTime`, `createdBy`
	)

VALUES
	('createOrder', 'ManageResourceOrdercreateOrderRequest', 'ManageResourceOrder', 'V2.0', 'Enterprise Portal', 'Request', 'Placeholder Security', 'SubmitNotification',  6, NOW(), NOW(), NOW(), 'COM System');


SELECT LAST_INSERT_ID() INTO p_productHeaderId;

	-- `OM_CMN_AccessSeekerContact`

	SELECT COALESCE(NULLIF(`accessSeekerContactContactName`,''), NULLIF(`accessSeekerContactContactPhone`,'')) INTO p_accessSeekerContact FROM OM_CMN_STG_BSSite WHERE id = p_stgBSSiteId AND processId = p_processId;

	IF p_accessSeekerContact IS NOT NULL AND p_accessSeekerContact != ''

	THEN

		INSERT INTO
			`OM_CMN_AccessSeekerContact`
			(
				`createdBy`, `contactName`, `contactPhone`
			)
			SELECT
				'Appian System', accessSeekerContactContactName, accessSeekerContactContactPhone
			FROM
				`OM_CMN_STG_BSSite`
			WHERE
				id = p_stgBSSiteId
				AND
				processId = p_processId;

		SELECT LAST_INSERT_ID() INTO p_accessSeekerContactId;

	END IF;

	-- `OM_CMN_Location`

	INSERT INTO
			`OM_CMN_Location`
			(
				`locId`, `longitude`, `latitude`, `matchType`, `state`, `postcode`, `locality`, `streetName`, `streetType`, `street`, `unitType`, `unitNumber`, `samId`, `addressFullText`
			)
			SELECT
				`locId`, `longitude`, `lattitude`, `matchType`, `state`, `postcode`, `localityName`, `streetName`, `streetType`, `streetOrLotNumber`, `propertyType`, `propertyNumber`, `samId`, `p_addressFullText`
			FROM
				`OM_CMN_STG_BSSite`
			WHERE
				id = p_stgBSSiteId
				AND
				processId = p_processId;

		SELECT LAST_INSERT_ID() INTO p_locationId;


	-- OM_CMN_Order

	SELECT
			STA_VER.id INTO p_statusVersionId from (SELECT
			id	,MAX(versionNo)
		FROM
			OM_CMN_R_StatusVersionRef
		WHERE
			productId = p_itemSubTypeRefId_NS
		AND
			mpoOrderType = p_orderType
		AND
			orderTypeRefId = p_orderTypeRefId
		AND
			shortfallType = ''
		AND
			isActiveFlag = 1) STA_VER ;

	SELECT OM_CMN_FUNC_GetLatestStatusVersionId(p_itemSubTypeRefId_NS,p_orderType,p_orderTypeRefId,"") INTO p_statusVersionId;

	INSERT INTO
			`OM_CMN_Order`
		(
			`productHeaderId`,`accessSeekerContactId`,`correlationId`,  `appianFolderId`, `statusVersionId`, `statusId`, `locationId`, `orderTypeRefId`, `state`, `name`, `orderDate`, `requestedCompletionDate`, `updatedBy`, `createdBy`, `updatedOnDTime`, `orderType`, `accessSeekerId`, `itemSubTypeRefId`, `USRN`, `channel`, `dealId`,`nbnURN`, `CRMCaseNumber`, `readyToConnectDate`, `originalSuppliedAddress`, `tranche`, `sitePriority`
		)
		SELECT
			p_productHeaderId,
			CASE WHEN p_accessSeekerContact IS NULL THEN NULL ELSE p_accessSeekerContactId END,
			`USRN`, p_appianFolderId,p_statusVersionId, p_initialStatusId, p_locationId, p_orderTypeRefId, `state`, p_productName, NOW(),

			OM_CMN_FUNC_ConvertStringToDate(`customerRequiredDate`),
			p_createdBy, p_createdBy, NOW(), p_orderType, p_accessSeekerId, p_itemSubTypeRefId_NS, `USRN`, 'Manual (PDP)', `p_dealId`, `nbnURN`, `CRMCaseNumber`,
			OM_CMN_FUNC_ConvertStringToDate(`readyToConnectDate`),

			`originalAddress`, `tranche`, `sitePriority`
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	SELECT LAST_INSERT_ID() INTO p_orderId;


	-- `OM_CMN_OrderItem` entry for NBN Select Item Subtype

	INSERT INTO
			`OM_CMN_OrderItem`
		(
			`orderId`, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `mainLineItemFlag`, `action`, `state`, `idx`, `entityId`
		)
		SELECT
			p_orderId, p_itemSubTypeRefId_NS, p_locationId, p_recordTypeRefId, 1, 'ADD', `state`, 0, 0
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	SELECT LAST_INSERT_ID() INTO p_orderItemIdNS;

	-- `OM_CMN_OrderItem` entry for NTD Item Subtype

	INSERT INTO
			`OM_CMN_OrderItem`
		(
			`orderId`, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `mainLineItemFlag`, `action`, `state`, `idx`, `entityId`
		)
		SELECT
			p_orderId, p_itemSubTypeRefId_NTD, p_locationId, p_recordTypeRefId, 0, 'ADD', `state`, 0, 0
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	SELECT LAST_INSERT_ID() INTO p_orderItemIdNTD;

	INSERT INTO
			`OM_CMN_OrderItem`
		(
			`orderId`, `itemSubTypeRefId`, `locationId`, `recordTypeRefId`, `mainLineItemFlag`, `hideSummaryRowFlag`, `state`, `idx`, `entityId`
		)
		SELECT
			p_orderId, p_itemSubTypeRefId_NPDPlanDesign, p_locationId, p_recordTypeRefId, 0, 1, `state`, 0, 0
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	SELECT LAST_INSERT_ID() INTO p_orderItemIdNSNPD;


	-- `OM_CMN_NBNSelect`

	INSERT INTO
			`OM_CMN_NBNSelect`
		(
			itemId,`recordTypeRefId`, `afterHoursSiteVisit`, `inductionRequired`, `securityRequirements`, `billingAccountId`, `notes`, `additionalNotes`, `tradingName`, `heritageSite`, `siteName`, `ownerAwareOfProposal`, `siteAccessInstructions`, `siteType`, `resourceOrderType`, `propertyOwnershipStatus`, `keysRequired`, `contractedLocationInstructions`, `safetyHazards`, `jsasswmRequired`, `workPracticesRequired`, `workingAtHeightsConsideration`, `confinedSpaceRequirements`, `numberOfServices`, `isComplexSite`, `internalPCDRequired`, `siteEquipmentOtherInfo`, `specialRequirementOther`, `detailedPLASEAssessment`
		)
		SELECT
			p_orderItemIdNS, p_recordTypeRefId, `afterHoursSiteVisit`, `inductionRequired`, `securityRequirements`, `accessSeekerInteractionBillingAccountID`, `notes`, `additionalNotes`, `tradingName`, `heritageSite`, `siteName`, `ownerAwareOfProposal`, `siteAccessInstructions`, `siteType`, 'nbnSelect', `propertyOwnershipStatus`, `keysRequired`, `contractedLocationInstructions`,`safetyHazards`, `jsaswmRequired`, `workPracticesRequired`, `workingAtHeightsConsideration`, `confinedSpaceRequirements`, `numberOfServices`, `isComplexSite`, `internalPCDRequired`, `siteEquipmentOtherInfo`, `specialRequirementOther`, `PLASEdetailedAssessment`
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	-- `OM_CMN_NTD`

	INSERT INTO
			`OM_CMN_NTD`
		(
			itemId,recordTypeRefId,`type`, `batteryBackupRequired`
		)
		SELECT
			p_orderItemIdNTD, p_recordTypeRefId, 'NTD', `batteryBackupRequired`
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	-- oM_CMN_NS_NPDPlanDesign

	INSERT INTO
			`OM_CMN_NS_NPDPlanDesign`
		(
			`itemId`, `tShirtClassificationFeasibility`, `buildComplexity`, `plannedPlanCommenceDate`, `plannedPlanCompletionDate`, `deliveryPartnerPDP`, `financeCode`
		)
		SELECT
			p_orderItemIdNSNPD, `TShirtClassificationFeasibility`, `category`,

			OM_CMN_FUNC_ConvertStringToDate(`plannedPlanCommenceDate`),
			OM_CMN_FUNC_ConvertStringToDate(`plannedPlanCompleteDate`),
			`deliveryPartner`, OM_CMN_FUNC_GetFinanceCode(p_stateText,p_dealId)
		FROM
			`OM_CMN_STG_BSSite`
		WHERE
			id = p_stgBSSiteId
			AND
			processId = p_processId;

	SELECT LAST_INSERT_ID() INTO p_nsNPDPlanDesignId;

	-- OM_CMN_Contact

	/* Business Contact Details */

	SELECT COALESCE(NULLIF(`businessContactFirstName`,''), NULLIF(`businessContactSurname`,''), NULLIF(`businessContactRole`,''), NULLIF(`businessContactContactEmail`,''), NULLIF(`businessContactContactNumber`,''), NULLIF(`businessContactStreetAddress`,''), NULLIF(`businessContactSuburb`,''), NULLIF(`businessContactPostcode`,''), NULLIF(`businessContactState`,''), NULLIF(`businessContactCompany`,'')) INTO p_businessContact
	FROM
		OM_CMN_STG_BSSite
	WHERE
	id = p_stgBSSiteId AND processId = p_processId;

	IF p_businessContact IS NOT NULL AND p_businessContact != ''

	THEN
		INSERT INTO
			`OM_CMN_Contact`
			(
				`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `role`, `emailAddress`, `phoneNumber`, `addressLine1`, `addressLine2`, `postcode`, `stateTerritoryCode`, `businessContactCompany`
			)
			SELECT
				p_orderItemIdNS, p_recordTypeRefId, p_createdBy, 'Business', CONCAT(`businessContactFirstName`, `businessContactSurname`), `businessContactRole`, `businessContactContactEmail`, `businessContactContactNumber`, `businessContactStreetAddress`, `businessContactSuburb`, `businessContactPostcode`, `businessContactState`, `businessContactCompany`
			FROM
				`OM_CMN_STG_BSSite`
				WHERE
					id = p_stgBSSiteId
					AND
					processId = p_processId;

	END IF;

	/* Site Contact Details */

	SELECT COALESCE(NULLIF(`siteContactFirstName`,''), NULLIF(`siteContactSurname`,''), NULLIF(`siteContactContactEmail`,''), NULLIF(`siteContactContactNumber`,''), NULLIF(`siteContactLandline`,'')) INTO p_siteContact
	FROM
		OM_CMN_STG_BSSite
	WHERE
	id = p_stgBSSiteId AND processId = p_processId;

	IF p_siteContact IS NOT NULL AND p_siteContact != ''

	THEN

		INSERT INTO
			`OM_CMN_Contact`
			(
				`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `emailAddress`, `phoneNumber`, `landlineContactNumber`
			)
			SELECT
				p_orderItemIdNS, p_recordTypeRefId, p_createdBy, 'Site', CONCAT(`siteContactFirstName`, `siteContactSurname`), `siteContactContactEmail`, `siteContactContactNumber`, `siteContactLandline`
			FROM
				`OM_CMN_STG_BSSite`
				WHERE
					id = p_stgBSSiteId
					AND
					processId = p_processId;

	END IF;

	/* Secondary Site Contact Details */

	SELECT COALESCE(NULLIF(`secondarySiteContactFirstName`,''), NULLIF(`secondarySiteContactSurname`,''), NULLIF(`secondarySiteContactContactEmail`,''), NULLIF(`secondarySiteContactContactNumber`,''), NULLIF(`secondarySiteContactLandline`,'')) INTO p_secondarySiteContact
	FROM
		OM_CMN_STG_BSSite
	WHERE
	id = p_stgBSSiteId AND processId = p_processId;

	IF p_secondarySiteContact IS NOT NULL AND p_secondarySiteContact != ''

	THEN

		INSERT INTO
			`OM_CMN_Contact`
			(
				`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `emailAddress`, `phoneNumber`, `landlineContactNumber`
			)
			SELECT
				p_orderItemIdNS, p_recordTypeRefId, p_createdBy, 'Site', CONCAT(`secondarySiteContactFirstName`, `secondarySiteContactSurname`), `secondarySiteContactContactEmail`, `secondarySiteContactContactNumber`, `secondarySiteContactLandline`
			FROM
				`OM_CMN_STG_BSSite`
				WHERE
					id = p_stgBSSiteId
					AND
					processId = p_processId;

	END IF;

	/* Building Management Contact Details */

	SELECT COALESCE(NULLIF(`buildingMgntContactName`,''), NULLIF(`buildingMgntContactPhone`,''), NULLIF(`buildingMgntContactEmail`,'')) INTO p_buildingMgntContact
	FROM
		OM_CMN_STG_BSSite
	WHERE
	id = p_stgBSSiteId AND processId = p_processId;

	IF p_buildingMgntContact IS NOT NULL AND p_buildingMgntContact != ''

	THEN

		INSERT INTO
			`OM_CMN_Contact`
			(
				`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `emailAddress`, `phoneNumber`
			)
			SELECT
				p_orderItemIdNS, p_recordTypeRefId, p_createdBy, 'Building Management', `buildingMgntContactName`, `buildingMgntContactEmail`, `buildingMgntContactPhone`
			FROM
				`OM_CMN_STG_BSSite`
				WHERE
					id = p_stgBSSiteId
					AND
					processId = p_processId;

	END IF;


	/* Building Owner Contact Details */

	SELECT COALESCE(NULLIF(`buildingOwnerContactName`,''), NULLIF(`buildingOwnerContactPhone`,''), NULLIF(`buildingOwnerContactEmail`,'')) INTO p_buildingOwnerContact
	FROM
		OM_CMN_STG_BSSite
	WHERE
	id = p_stgBSSiteId AND processId = p_processId;

	IF p_buildingOwnerContact IS NOT NULL AND p_buildingOwnerContact != ''

	THEN

		INSERT INTO
			`OM_CMN_Contact`
			(
				`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `emailAddress`, `phoneNumber`
			)
			SELECT
				p_orderItemIdNS, p_recordTypeRefId, p_createdBy, 'Building Owner', `buildingOwnerContactName`, `buildingOwnerContactEmail`, `buildingOwnerContactPhone`
			FROM
				`OM_CMN_STG_BSSite`
				WHERE
					id = p_stgBSSiteId
					AND
					processId = p_processId;

	END IF;


	/* Client HSE Manager Contact Details */

	SELECT COALESCE(NULLIF(`clientHSEMgrContactName`,''), NULLIF(`clientHSEMgrContactPhone`,''), NULLIF(`clientHSEMgrContactEmail`,'')) INTO p_clientHSEMgrContact
	FROM
		OM_CMN_STG_BSSite
	WHERE
	id = p_stgBSSiteId AND processId = p_processId;

	IF p_clientHSEMgrContact IS NOT NULL AND p_clientHSEMgrContact != ''

	THEN

		INSERT INTO
			`OM_CMN_Contact`
			(
				`itemId`, `recordTypeRefId`, createdBy,`type`, `contactName`, `emailAddress`, `phoneNumber`
			)
			SELECT
				p_orderItemIdNS, p_recordTypeRefId, p_createdBy, 'Client HSE Manager', `clientHSEMgrContactName`, `clientHSEMgrContactEmail`, `clientHSEMgrContactPhone`
			FROM
				`OM_CMN_STG_BSSite`
				WHERE
					id = p_stgBSSiteId
					AND
					processId = p_processId;

	END IF;


	INSERT INTO
			`OM_CMN_OrderContactLink`
		(
			contactId,
			orderItemId
		)
		SELECT
			entity.id,
			entity.itemId
		FROM
			`OM_CMN_Contact` entity
		INNER JOIN
			`OM_CMN_OrderItem` item
		ON
			entity.itemId = item.id
		AND
			item.orderId = p_orderId;


	-- this will ensure the transaction above is not committed and therefore effectively rolled back if in test mode
	IF p_isTestCaseFlag = TRUE THEN
		SELECT 0;
	ELSE
		COMMIT;
	END IF;


	SELECT
		p_processId,
		id,
		parentOrderId,
		omId,
        statusVersionId,
		productHeaderId,
		correlationId,
		correlationName,
		appianFolderId,
		statusId,
		orderTypeRefId,
		state,
		name,
		description,
		priority,
		orderdate,
		expectedCompletionDate,
		completionDate,
		requestedStartDate,
		requestedCompletionDate,
		updatedBy,
		createdBy,
		updatedOnDTime,
		priId,
		orderType,
		applicationId,
		accessSeekerContactId,
		accessSeekerId,
		substatusId,
		pendFlag,
		subprocessPendFlag,
		opoAppianDocId,
		locationId,
		npdStatusId,
		npdSubstatusId,
		sendNotificationsFlag,
		finalStatusCompletedFlag,
		createdOnDTime,
		itemSubTypeRefId,
		USRN,
		channel,
		dealId,
		nbnURN,
		CRMCaseNumber,
		readyToConnectDate,
		originalSuppliedAddress,
		tranche,
		sitePriority,
		shortfallType,
		falloutFlag,
		custPendFlag,
		afterHoursProcessing
	FROM
		OM_CMN_Order
	WHERE
		id = p_orderId;

END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS OM_CMN_SP_ValidateForGenericErrors;
DELIMITER $$
CREATE PROCEDURE `OM_CMN_SP_ValidateForGenericErrors`(IN `p_processId` INT, OUT `p_isError` BOOLEAN)
    NO SQL
BEGIN
    DECLARE EXIT
HANDLER FOR SQLEXCEPTION
SET
    p_isError = 1 ;
	-- Validate DEAL ID
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'DEAL ID is NULL'
    )
WHERE
    (`OM_CMN_STG_BSSite`.dealName IS NULL OR `OM_CMN_STG_BSSite`.dealName = '') AND processId = p_processId ;

	-- Validate USRN
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'USRN is NULL'
    )
WHERE
    (`OM_CMN_STG_BSSite`.USRN IS NULL OR `OM_CMN_STG_BSSite`.USRN = '') AND processId = p_processId ;

	-- Validate State
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.state IS  NULL
        ) OR (`OM_CMN_STG_BSSite`.state = '')
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            `OM_CMN_STG_BSSite`.state IN(
                'VIC',
                'TAS',
                'QLD',
                'NSW',
                'SA',
                'WA',
                'ACT',
                'NT'

        )
    ) THEN
	`OM_CMN_STG_BSSite`.errorDetails

     ELSE
	 OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'State value is incorrect'
    )

END
WHERE processId = p_processId;


	-- Validate TShirtClassificationFeasibility
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.TShirtClassificationFeasibility IS  NULL
        ) OR (`OM_CMN_STG_BSSite`.TShirtClassificationFeasibility = '')
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            `OM_CMN_STG_BSSite`.TShirtClassificationFeasibility IN(
                'Small',
                'Medium',
                'Large',
                'Extra Large'

        )
    ) THEN
	`OM_CMN_STG_BSSite`.errorDetails

     ELSE
	 OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'TShirtClassificationFeasibility is incorrect'
    )

END
WHERE processId = p_processId;


	-- Validate Category
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.category IS  NULL
        ) OR (`OM_CMN_STG_BSSite`.category = '')
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            `OM_CMN_STG_BSSite`.category IN(
                'Simplex',
                'Complex'

        )
    ) THEN
	`OM_CMN_STG_BSSite`.errorDetails

     ELSE
	 OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Category is incorrect'
    )

END
WHERE processId = p_processId;

	-- Validate Delivery Partner(NBN SELECT)
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.deliveryPartner IS  NULL
        ) OR (`OM_CMN_STG_BSSite`.deliveryPartner = '')
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            `OM_CMN_STG_BSSite`.deliveryPartner IN(
                'Fulton Hogan',
                'Servicestream',
				'Visionstream',
                'Downer'
        )
    ) THEN
	`OM_CMN_STG_BSSite`.errorDetails

     ELSE
	 OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Delivery Partner is incorrect'
    )

END
WHERE processId = p_processId;


	-- Validate InternalPCDRequired
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.internalPCDRequired IS  NULL
        ) OR (`OM_CMN_STG_BSSite`.internalPCDRequired = '')
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            `OM_CMN_STG_BSSite`.internalPCDRequired IN(
                'Yes',
                'No'
        )
    ) THEN
	`OM_CMN_STG_BSSite`.errorDetails

     ELSE
	 OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'InternalPCDRequired should be Yes or No'
    )

END
WHERE processId = p_processId;

	-- Validate Complex Site
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.isComplexSite IS  NULL
        ) OR (`OM_CMN_STG_BSSite`.isComplexSite = '')
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            `OM_CMN_STG_BSSite`.isComplexSite IN(
                'Yes',
                'No'
        )
    ) THEN
	`OM_CMN_STG_BSSite`.errorDetails

     ELSE
	 OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Complex Site should be Yes or No'
    )

END
WHERE processId = p_processId;

 -- Validate postcode
 UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails =
    CASE WHEN (postcode is null) OR (postcode = '') OR(postcode REGEXP '^[0-9]{4}$') THEN `OM_CMN_STG_BSSite`.errorDetails
    ELSE OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Postcode is invalid'
    )
    END
WHERE processId = p_processId;
    -- Validate businessContactState against LOV
UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE WHEN
        (
            `OM_CMN_STG_BSSite`.businessContactState IS  NULL
        ) OR(`OM_CMN_STG_BSSite`.businessContactState = '')
		THEN
		`OM_CMN_STG_BSSite`.errorDetails
		WHEN
            `OM_CMN_STG_BSSite`.businessContactState   IN(
                'VIC',
                'TAS',
                'QLD',
                'NSW',
                'SA',
                'WA',
                'ACT'
            )

     THEN
	  `OM_CMN_STG_BSSite`.errorDetails


     ELSE
   OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Business Contact State value is incorrect'
    )
END
WHERE processId = p_processId;

 -- Validate businessContact postcode
 UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails =
    CASE WHEN (businessContactPostcode is null)  OR (businessContactPostcode REGEXP '^[0-9]{4}$') OR (businessContactPostcode = '') THEN `OM_CMN_STG_BSSite`.errorDetails
    ELSE OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Business Contact Postcode is invalid'
    )
    END
WHERE processId = p_processId;

-- validate customerRequiredDate

 UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE  WHEN
        ((
            `OM_CMN_STG_BSSite`.customerRequiredDate IS NULL
        ) OR
		(
            `OM_CMN_STG_BSSite`.customerRequiredDate = ''
        )) THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN (
            DATE(
                `OM_CMN_STG_BSSite`.customerRequiredDate
            ) IS NOT NULL AND DATE(
                `OM_CMN_STG_BSSite`.customerRequiredDate
            ) = '0000-00-00'
        )
     THEN OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Invalid date in customerRequiredDate'
    )
	ELSE
	`OM_CMN_STG_BSSite`.errorDetails

END
WHERE
	  processId = p_processId;

 -- validate plannedPlanCommenceDate

 UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE  WHEN
        (
            `OM_CMN_STG_BSSite`.plannedPlanCommenceDate IS NOT NULL
        ) OR
		(
            `OM_CMN_STG_BSSite`.plannedPlanCommenceDate = ''
        )
			then `OM_CMN_STG_BSSite`.errorDetails
		WHEN
		(
            DATE(
                `OM_CMN_STG_BSSite`.plannedPlanCommenceDate
            ) IS NOT NULL AND DATE(
                `OM_CMN_STG_BSSite`.plannedPlanCommenceDate
            ) = '0000-00-00'
        )
     THEN OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Invalid date in plannedPlanCommenceDate'
    )
	ELSE
	`OM_CMN_STG_BSSite`.errorDetails
END
WHERE
	  processId = p_processId;

 -- validate plannedPlanCompleteDate

 UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE  WHEN
        (
            `OM_CMN_STG_BSSite`.plannedPlanCompleteDate IS  NULL
        ) OR
		(
            `OM_CMN_STG_BSSite`.plannedPlanCompleteDate = ''
        )
		THEN `OM_CMN_STG_BSSite`.errorDetails
		WHEN
		            DATE(
                `OM_CMN_STG_BSSite`.plannedPlanCompleteDate
            ) IS NOT NULL AND DATE(
                `OM_CMN_STG_BSSite`.plannedPlanCompleteDate
            ) = '0000-00-00'

    THEN OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Invalid date in plannedPlanCompleteDate'
    )
	ELSE
	 `OM_CMN_STG_BSSite`.errorDetails
END
WHERE
	  processId = p_processId;

 -- readyToConnectDate

 UPDATE
    `OM_CMN_STG_BSSite`
SET
    errorDetails = CASE  WHEN
        (
            `OM_CMN_STG_BSSite`.readyToConnectDate IS  NULL
        ) OR
		(
            `OM_CMN_STG_BSSite`.readyToConnectDate = ''
        ) THEN `OM_CMN_STG_BSSite`.errorDetails

		WHEN
            DATE(
                `OM_CMN_STG_BSSite`.readyToConnectDate
            ) IS NOT NULL AND DATE(
                `OM_CMN_STG_BSSite`.readyToConnectDate
            ) = '0000-00-00'

     THEN OM_CMN_FUNC_ConcatenateString(
        `OM_CMN_STG_BSSite`.errorDetails,
        'Invalid date in readyToConnectDate'
    )
	ELSE
	`OM_CMN_STG_BSSite`.errorDetails
END
WHERE
	  processId = p_processId;

COMMIT    ;
SET
    p_isError = 0 ;
END$$
DELIMITER ;


CALL OM_CMN_SP_UpdateLookUp();



SET FOREIGN_KEY_CHECKS = 1;