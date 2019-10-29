/*
Data Store: bTestDStore
Created: 2019-10-29T17:35:45.908Z
By: william.hagen.s
Appian Version: 20.1.0.31
Target Database: MySQL 5.7.26-log
Database Driver: MySQL Connector Java mysql-connector-java-5.1.47 ( Revision: fe1903b1ecb4a96a917f7ed3190d80c049b1de29 )
*/

/* UPDATE DDL */
    create table `btestcdt` (
        `id` integer not null,
        primary key (`id`)
    ) ENGINE=InnoDB;

/* DROP AND CREATE DDL */
/* WARNING: The DDL commented out below will drop and re-create all tables.
    drop table if exists `btestcdt`;

    create table `btestcdt` (
        `id` integer not null,
        primary key (`id`)
    ) ENGINE=InnoDB;
*/
