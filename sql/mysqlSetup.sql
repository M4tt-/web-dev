/*-----------------------------------------------------------------------------------*
 | Title: mysqlSetup.sql															 |
 | Author: M. Runyon																 |
 | Date: February 28th, 2017														 |
 |																					 |
 | Description: This script configures a MySQL server for my personal web sites blog.|
\*-----------------------------------------------------------------------------------*/

/* Create dummy user for commenting */
CREATE USER 'user'@'localhost';
GRANT INSERT, SELECT, UPDATE ON db_blog.* TO 'user'@'localhost';

/* LOOK INTO SQL INJECTION PROTECTION */
/* VISIT http://www.cssnewbie.com/showhide-content-css-javascript/#.WLYzKn9H6hz FOR SHOW/HIDE FEATURES */
/* WORDS I LIKE: COXCOMB, CANTANKEROUS, FIDUCIAL, */