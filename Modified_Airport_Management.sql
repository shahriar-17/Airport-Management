CREATE TABLE "ACCOUNT" (
  "ACCOUNT_ID" NUMBER VISIBLE NOT NULL,
  "PROFIT" FLOAT(126) VISIBLE NOT NULL,
  "CREDIT" FLOAT(126) VISIBLE NOT NULL,
  "DEBIT" FLOAT(126) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007994" PRIMARY KEY ("ACCOUNT_ID"),
  CONSTRAINT "SYS_C007990" CHECK ("ACCOUNT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007991" CHECK ("PROFIT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007992" CHECK ("CREDIT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007993" CHECK ("DEBIT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "AIRLINES" (
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  "AIRLINES_ID" NUMBER VISIBLE NOT NULL,
  "AIRLINES_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "CITY" CHAR(255 BYTE) VISIBLE NOT NULL,
  "COUNTRY" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007926" PRIMARY KEY ("FLIGHT_NO"),
  CONSTRAINT "SYS_C007921" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007922" CHECK ("AIRLINES_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007923" CHECK ("AIRLINES_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007924" CHECK ("CITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007925" CHECK ("COUNTRY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "AIRPLANE" (
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  "AIRLINES_ID" NUMBER VISIBLE NOT NULL,
  "AIRPLANE_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "SOURCE" CHAR(255 BYTE) VISIBLE NOT NULL,
  "DESTINATION" CHAR(255 BYTE) VISIBLE NOT NULL,
  "CAPACITY" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007983" PRIMARY KEY ("FLIGHT_NO"),
  CONSTRAINT "SYS_C007977" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007978" CHECK ("AIRLINES_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007979" CHECK ("AIRPLANE_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007980" CHECK ("SOURCE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007981" CHECK ("DESTINATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007982" CHECK ("CAPACITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "AIRPORT" (
  "AIRPORT_ID" NUMBER VISIBLE NOT NULL,
  "AIRPORT_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "CITY" CHAR(255 BYTE) VISIBLE NOT NULL,
  "COUNTRY" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007976" PRIMARY KEY ("AIRPORT_ID"),
  CONSTRAINT "SYS_C007972" CHECK ("AIRPORT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007973" CHECK ("AIRPORT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007974" CHECK ("CITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007975" CHECK ("COUNTRY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "AVAILABLE" (
  "TICKET_NO" NUMBER VISIBLE NOT NULL,
  "YES" NUMBER VISIBLE NOT NULL,
  "NO" NUMBER VISIBLE NOT NULL,
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007912" PRIMARY KEY ("TICKET_NO"),
  CONSTRAINT "SYS_C007908" CHECK ("TICKET_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007909" CHECK ("YES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007910" CHECK ("NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007911" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "CLASS" (
  "TICKET_NO" NUMBER VISIBLE NOT NULL,
  "ECONOMY" NUMBER VISIBLE NOT NULL,
  "BUSINESS" NUMBER VISIBLE NOT NULL,
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007900" PRIMARY KEY ("TICKET_NO"),
  CONSTRAINT "SYS_C007896" CHECK ("TICKET_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007897" CHECK ("ECONOMY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007898" CHECK ("BUSINESS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007899" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "EMPLOYEES" (
  "EMPLOYEE_ID" NUMBER VISIBLE NOT NULL,
  "FIRST_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "LAST_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "SALARY" FLOAT(126) VISIBLE NOT NULL,
  "ADDRESS" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007964" PRIMARY KEY ("EMPLOYEE_ID"),
  CONSTRAINT "SYS_C007959" CHECK ("FIRST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007960" CHECK ("LAST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007961" CHECK ("EMPLOYEE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007962" CHECK ("SALARY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007963" CHECK ("ADDRESS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "EMPLOYEES_ADDRESS" (
  "EMPLOYEE_ID" NUMBER VISIBLE NOT NULL,
  "STREET_NO" NUMBER VISIBLE NOT NULL,
  "CITY" CHAR(255 BYTE) VISIBLE NOT NULL,
  "POSTAL_CODE" NUMBER VISIBLE NOT NULL,
  "COUNTRY" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007970" PRIMARY KEY ("EMPLOYEE_ID"),
  CONSTRAINT "SYS_C007965" CHECK ("EMPLOYEE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007966" CHECK ("STREET_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007967" CHECK ("CITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007968" CHECK ("POSTAL_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007969" CHECK ("COUNTRY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "LOCATION" (
  "FLIGHT_ID" NUMBER VISIBLE NOT NULL,
  "TIME_RANGE" NUMBER VISIBLE NOT NULL,
  "PLACE" CHAR(255 BYTE) VISIBLE NOT NULL,
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007988" PRIMARY KEY ("FLIGHT_ID"),
  CONSTRAINT "SYS_C007984" CHECK ("FLIGHT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007985" CHECK ("TIME_RANGE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007986" CHECK ("PLACE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007987" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "LOGIN_AS_ADMIN" (
  "ADMIN_ID" NUMBER VISIBLE NOT NULL,
  "PASSWORD" CHAR(255 BYTE) VISIBLE NOT NULL,
  "SECURITY_CODE" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007958" PRIMARY KEY ("ADMIN_ID"),
  CONSTRAINT "SYS_C007955" CHECK ("ADMIN_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007956" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007957" CHECK ("SECURITY_CODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "MAIN_SERVE" (
  "ADMIN_ID" NUMBER VISIBLE NOT NULL,
  "PASSENGER_ID" NUMBER VISIBLE NOT NULL,
  "AIRPORT_ID" NUMBER VISIBLE NOT NULL,
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  "EMPLOYEE_ID" NUMBER VISIBLE NOT NULL,
  "NEW_COLUMN" NUMBER VISIBLE NOT NULL,
  "ACCOUNT_ID" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007995" CHECK ("ADMIN_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007996" CHECK ("PASSENGER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007997" CHECK ("AIRPORT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007998" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007999" CHECK ("EMPLOYEE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C008000" CHECK ("NEW_COLUMN" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C008001" CHECK ("ACCOUNT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "PASSENGER" (
  "PASSENGER_ID" NUMBER VISIBLE NOT NULL,
  "FIRST_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "LAST_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "EMAIL" CHAR(255 BYTE) VISIBLE NOT NULL,
  "AGE" NUMBER VISIBLE NOT NULL,
  "LOGIN_ID" NUMBER VISIBLE NOT NULL,
  "ADDRESS" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007935" PRIMARY KEY ("PASSENGER_ID"),
  CONSTRAINT "SYS_C007928" CHECK ("PASSENGER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007929" CHECK ("FIRST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007930" CHECK ("LAST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007931" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007932" CHECK ("AGE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007933" CHECK ("LOGIN_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007934" CHECK ("ADDRESS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "PASSENGERS_ADDRESS" (
  "PASSENGER_ID" NUMBER VISIBLE NOT NULL,
  "STREET_ID" NUMBER VISIBLE NOT NULL,
  "CITY" CHAR(255 BYTE) VISIBLE NOT NULL,
  "COUNTRY" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007953" PRIMARY KEY ("PASSENGER_ID"),
  CONSTRAINT "SYS_C007949" CHECK ("PASSENGER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007950" CHECK ("STREET_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007951" CHECK ("CITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007952" CHECK ("COUNTRY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "PAYMENT" (
  "TICKET_NO" NUMBER VISIBLE NOT NULL,
  "FEES" FLOAT(126) VISIBLE NOT NULL,
  "TRANSCATION_ID" CHAR(255 BYTE) VISIBLE NOT NULL,
  "TICKET_MODE" CHAR(255 BYTE) VISIBLE NOT NULL,
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007919" PRIMARY KEY ("TICKET_NO"),
  CONSTRAINT "SYS_C007914" CHECK ("TICKET_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007915" CHECK ("FEES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007916" CHECK ("TRANSCATION_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007917" CHECK ("TICKET_MODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007918" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "SEAT" (
  "TICKET_NO" NUMBER VISIBLE NOT NULL,
  "COL_NO" NUMBER VISIBLE NOT NULL,
  "ROW_NO" NUMBER VISIBLE NOT NULL,
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007906" PRIMARY KEY ("TICKET_NO"),
  CONSTRAINT "SYS_C007902" CHECK ("TICKET_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007903" CHECK ("COL_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007904" CHECK ("ROW_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007905" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "SIGN_IN" (
  "LOGIN_ID" NUMBER VISIBLE NOT NULL,
  "PASSWORD" CHAR(255 BYTE) VISIBLE NOT NULL,
  "PASSENGER_ID" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007939" PRIMARY KEY ("LOGIN_ID"),
  CONSTRAINT "SYS_C007936" CHECK ("LOGIN_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007937" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007938" CHECK ("PASSENGER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "SIGN_UP" (
  "PASSENGER_ID" NUMBER VISIBLE NOT NULL,
  "FIRST_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "LAST_NAME" CHAR(255 BYTE) VISIBLE NOT NULL,
  "EMAIL" CHAR(255 BYTE) VISIBLE NOT NULL,
  "DATE_OF_BIRTH" DATE VISIBLE NOT NULL,
  "ADDRESS" CHAR(255 BYTE) VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007947" PRIMARY KEY ("PASSENGER_ID"),
  CONSTRAINT "SYS_C007941" CHECK ("PASSENGER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007942" CHECK ("FIRST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007943" CHECK ("LAST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007944" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007945" CHECK ("DATE_OF_BIRTH" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007946" CHECK ("ADDRESS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

CREATE TABLE "TICKET" (
  "FLIGHT_NO" NUMBER VISIBLE NOT NULL,
  "TICKET_NO" NUMBER VISIBLE NOT NULL,
  "SOURCE" CHAR(255 BYTE) VISIBLE NOT NULL,
  "DESTINATION" CHAR(255 BYTE) VISIBLE NOT NULL,
  "FLIGHT_TIME" DATE VISIBLE NOT NULL,
  "FEES" FLOAT(126) VISIBLE NOT NULL,
  "SEAT_NO" NUMBER VISIBLE NOT NULL,
  "AVAILABLE" NUMBER VISIBLE NOT NULL,
  "CLASS" CHAR(255 BYTE) VISIBLE NOT NULL,
  "PASSENGER_ID" NUMBER VISIBLE NOT NULL,
  "CANCELED" NUMBER VISIBLE NOT NULL,
  CONSTRAINT "SYS_C007895" PRIMARY KEY ("FLIGHT_NO"),
  CONSTRAINT "SYS_C007884" CHECK ("FLIGHT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007885" CHECK ("TICKET_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007886" CHECK ("SOURCE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007887" CHECK ("DESTINATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007888" CHECK ("FLIGHT_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007889" CHECK ("FEES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007890" CHECK ("SEAT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007891" CHECK ("AVAILABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007892" CHECK ("CLASS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007893" CHECK ("PASSENGER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE,
  CONSTRAINT "SYS_C007894" CHECK ("CANCELED" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE
)
TABLESPACE "SYSAUX"
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT;

ALTER TABLE "AIRLINES" ADD CONSTRAINT "SYS_C007927" FOREIGN KEY ("FLIGHT_NO") REFERENCES "TICKET" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "AVAILABLE" ADD CONSTRAINT "SYS_C007913" FOREIGN KEY ("FLIGHT_NO") REFERENCES "TICKET" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "CLASS" ADD CONSTRAINT "SYS_C007901" FOREIGN KEY ("FLIGHT_NO") REFERENCES "TICKET" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "EMPLOYEES_ADDRESS" ADD CONSTRAINT "SYS_C007971" FOREIGN KEY ("EMPLOYEE_ID") REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "LOCATION" ADD CONSTRAINT "SYS_C007989" FOREIGN KEY ("FLIGHT_NO") REFERENCES "AIRPLANE" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MAIN_SERVE" ADD CONSTRAINT "SYS_C008002" FOREIGN KEY ("ADMIN_ID") REFERENCES "LOGIN_AS_ADMIN" ("ADMIN_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MAIN_SERVE" ADD CONSTRAINT "SYS_C008003" FOREIGN KEY ("PASSENGER_ID") REFERENCES "PASSENGER" ("PASSENGER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MAIN_SERVE" ADD CONSTRAINT "SYS_C008004" FOREIGN KEY ("AIRPORT_ID") REFERENCES "AIRPORT" ("AIRPORT_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MAIN_SERVE" ADD CONSTRAINT "SYS_C008005" FOREIGN KEY ("FLIGHT_NO") REFERENCES "AIRPLANE" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MAIN_SERVE" ADD CONSTRAINT "SYS_C008006" FOREIGN KEY ("EMPLOYEE_ID") REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "MAIN_SERVE" ADD CONSTRAINT "SYS_C008007" FOREIGN KEY ("ACCOUNT_ID") REFERENCES "ACCOUNT" ("ACCOUNT_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "PASSENGERS_ADDRESS" ADD CONSTRAINT "SYS_C007954" FOREIGN KEY ("PASSENGER_ID") REFERENCES "PASSENGER" ("PASSENGER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "PAYMENT" ADD CONSTRAINT "SYS_C007920" FOREIGN KEY ("FLIGHT_NO") REFERENCES "TICKET" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SEAT" ADD CONSTRAINT "SYS_C007907" FOREIGN KEY ("FLIGHT_NO") REFERENCES "TICKET" ("FLIGHT_NO") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SIGN_IN" ADD CONSTRAINT "SYS_C007940" FOREIGN KEY ("PASSENGER_ID") REFERENCES "PASSENGER" ("PASSENGER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "SIGN_UP" ADD CONSTRAINT "SYS_C007948" FOREIGN KEY ("PASSENGER_ID") REFERENCES "PASSENGER" ("PASSENGER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TICKET" ADD CONSTRAINT "FK_TICKET_PASSENGER_1" FOREIGN KEY ("PASSENGER_ID") REFERENCES "PASSENGER" ("PASSENGER_ID");

