CREATE TABLE MESSAGE (
	RECEIVER_EMPLOYEE_NO NVARCHAR2(10), 
	SENDER_EMPLOYEE_NO NVARCHAR2(10), 
	MESSAGE_CONTENT NVARCHAR2(200), 
	WRITE_DATE DATE 
);

CREATE TABLE EMPLOYEE (
	EMPLOYEE_NO NVARCHAR2(10) NOT NULL, 
	TEAM_ID NVARCHAR2(10), 
	EMAIL NVARCHAR2(50), 
	EMPLOYEE_NAME NVARCHAR2(50), 
	JOIN_DATE DATE, 
	PASSWORD NVARCHAR2(50),
	IS_AUTHORITY NVARCHAR2(5), 
	LAST_LOGIN DATE, 
	POSITION_ID NVARCHAR2(10), 
	ROLE NVARCHAR2(10), 
	IMAGE_URL NVARCHAR2(50) 
);

CREATE UNIQUE INDEX PK_EMPLOYEE
	ON EMPLOYEE (
		EMPLOYEE_NO ASC
	);

ALTER TABLE EMPLOYEE
	ADD
		CONSTRAINT PK_EMPLOYEE
		PRIMARY KEY (
			EMPLOYEE_NO
		);