--#SET TERMINATOR ;

/*
 This file is part of db2unit: A unit testing framework for DB2 LUW.
 Copyright (C)  2014  Andres Gomez Casanova (@AngocA)

 db2unit is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 db2unit is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.

 Andres Gomez Casanova <angocaATyahooDOTcom>
*/

SET CURRENT SCHEMA DB2UNIT_1;

/**
 * Defines the headers of the public routines.
 *
 * Version: 2014-04-30 1-Beta
 * Author: Andres Gomez Casanova (AngocA)
 * Made in COLOMBIA.
 */

-- Module for objects of the db2unit framework.
CREATE OR REPLACE MODULE DB2UNIT;

COMMENT ON MODULE DB2UNIT IS 'Objects for the db2unit utility';

CREATE OR REPLACE PUBLIC ALIAS DB2UNIT FOR MODULE DB2UNIT;

COMMENT ON PUBLIC ALIAS DB2UNIT FOR MODULE IS 'Public objects of db2unit';

-- Utility schema.
ALTER MODULE DB2UNIT PUBLISH
  VARIABLE UTILITY_SCHEMA VARCHAR(16) CONSTANT 'DB2UNIT_1';

-- License.
ALTER MODULE DB2UNIT PUBLISH
  VARIABLE LICENSE VARCHAR(80) CONSTANT
  'db2unit is licensed under the terms of the GPL v3';

-- Constant for the name of the report's table.
ALTER MODULE DB2UNIT PUBLISH
  VARIABLE REPORTS_TABLE VARCHAR(16) CONSTANT 'REPORT_TESTS';

-- Transaction mode execution.
ALTER MODULE DB2UNIT PUBLISH
  VARIABLE AUTONOMOUS_EXEC BOOLEAN DEFAULT TRUE;

-- Execute one test of the suite of tests.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE RUN_SUITE (
  IN SCHEMA_NAME ANCHOR SYSCAT.SCHEMATA.SCHEMANAME,
  IN PREV_EXEC_ID ANCHOR EXECUTION_REPORTS.EXECUTION_ID DEFAULT NULL,
  IN PROC_NAME ANCHOR SYSCAT.PROCEDURES.PROCNAME DEFAULT NULL
  );

-- Execute the suite of test.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE RUN_SUITE (
  IN SCHEMA_NAME ANCHOR SYSCAT.SCHEMATA.SCHEMANAME,
  IN PREV_EXEC_ID ANCHOR EXECUTION_REPORTS.EXECUTION_ID DEFAULT NULL
  );

-- Register suite.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE REGISTER_SUITE (
  IN SCHEMA_NAME ANCHOR SYSCAT.SCHEMATA.SCHEMANAME
  );

-- Cleans environment.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE CLEAN (
  );

-- Cleans the result of the last assertion.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE CLEAN_TEST_RESULT (
  );

-- Reset tables of this framework.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE RESET_TABLES (
  );

-- Release lock for a given suite.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE RELEASE_LOCK (
  NAME ANCHOR SYSCAT.SCHEMATA.SCHEMANAME
  );

-- Changes the transaction autonomous mode.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE SET_AUTONOMOUS (
  IN AUTONOMOUS BOOLEAN
  );

-- Changes the sort type for the procedures.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE RANDOM_SORT (
  IN RANDOM BOOLEAN
  );

-- Export set of registered test in a file ready to execute in Linux
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE EXPORT_TESTS_LIST (
  );

-- Show the license used in this program.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE LICENSE (
  );

-- GENERAL

-- Registers the name. Useful for a failing test without assertions call.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE REGISTER_MESSAGE(
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT
  );

-- Fails the current test.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE FAIL (
  );

-- Fails the current test with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE FAIL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT
  );

-- STRING

-- Asserts equals two strings.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_STRING_EQUALS (
  IN EXPECTED ANCHOR MAX_STRING.STRING,
  IN ACTUAL ANCHOR MAX_STRING.STRING
  );

-- Asserts equals two strings with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_STRING_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED ANCHOR MAX_STRING.STRING,
  IN ACTUAL ANCHOR MAX_STRING.STRING
  );

-- Asserts that the string is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_STRING_NULL (
  IN STRING ANCHOR MAX_STRING.STRING
  );

-- Asserts that the string is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_STRING_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN STRING ANCHOR MAX_STRING.STRING
  );

-- Asserts that the string is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_STRING_NOT_NULL (
  IN STRING ANCHOR MAX_STRING.STRING
  );

-- Asserts that the string is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_STRING_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN STRING ANCHOR MAX_STRING.STRING
  );

-- BOOLEAN

-- Asserts equals two booleans.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_EQUALS (
  IN EXPECTED BOOLEAN,
  IN ACTUAL BOOLEAN
  );

-- Asserts equals two booleans with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED BOOLEAN,
  IN ACTUAL BOOLEAN
  );

-- Asserts the true value.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_TRUE (
  IN VALUE BOOLEAN
  );

-- Asserts the true value with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_TRUE (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE BOOLEAN
  );

-- Asserts the false value.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_FALSE (
  IN CONDITION BOOLEAN
  );

-- Asserts the false value with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_FALSE (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN CONDITION BOOLEAN
  );

-- Asserts that the boolean is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_NULL (
  IN CONDITION BOOLEAN
  );

-- Asserts that the boolean is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN CONDITION BOOLEAN
  );

-- Asserts that the boolean is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_NOT_NULL (
  IN CONDITION BOOLEAN
  );

-- Asserts that the boolean is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_BOOLEAN_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN CONDITION BOOLEAN
  );

-- INTEGER

-- Asserts equals two integers.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_INT_EQUALS (
  IN EXPECTED BIGINT,
  IN ACTUAL BIGINT
  );

-- Asserts equals two integers with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_INT_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED BIGINT,
  IN ACTUAL BIGINT
  );

-- Asserts that the int is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_INT_NULL (
  IN VALUE BIGINT
  );

-- Asserts that the int is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_INT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE BIGINT
  );

-- Asserts that the int is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_INT_NOT_NULL (
  IN VALUE BIGINT
  );

-- Asserts that the int is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_INT_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE BIGINT
  );

-- DECIMAL

-- Asserts equals two decimals.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DEC_EQUALS (
  IN EXPECTED DECFLOAT,
  IN ACTUAL DECFLOAT
  );

-- Asserts equals two decimals with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DEC_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED DECFLOAT,
  IN ACTUAL DECFLOAT
  );

-- Asserts that the decimal is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DEC_NULL (
  IN VALUE DECFLOAT
  );

-- Asserts that the decimal is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DEC_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE DECFLOAT
  );

-- Asserts that the decimal is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DEC_NOT_NULL (
  IN VALUE DECFLOAT
  );

-- Asserts that the decimal is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DEC_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE DECFLOAT
  );

-- TABLES

-- Asserts equals two tables.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TABLE_EQUALS (
  IN EXPECTED_SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN EXPECTED_TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME,
  IN ACTUAL_SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN ACTUAL_TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME
  );

-- Asserts equals two tables with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TABLE_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED_SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN EXPECTED_TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME,
  IN ACTUAL_SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN ACTUAL_TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME
  );

-- Asserts that the table is empty.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TABLE_EMPTY (
  IN SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME
  );

-- Asserts that the table is empty with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TABLE_EMPTY (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME
  );

-- Asserts that the table is not empty.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TABLE_NON_EMPTY (
  IN SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME
  );

-- Asserts that the table is not empty with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TABLE_NON_EMPTY (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN SCHEMA ANCHOR SYSCAT.TABLES.TABSCHEMA,
  IN TABLE_NAME ANCHOR SYSCAT.TABLES.TABNAME
  );

-- DATETIMES (TIMESTAMP)

-- Asserts equals two timestamps.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIMESTAMP_EQUALS (
  IN EXPECTED TIMESTAMP,
  IN ACTUAL TIMESTAMP
  );

-- Asserts equals two timestamps with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIMESTAMP_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED TIMESTAMP,
  IN ACTUAL TIMESTAMP
  );

-- Asserts that the timestamp is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIMESTAMP_NULL (
  IN VALUE TIMESTAMP
  );

-- Asserts that the timestamp is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIMESTAMP_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE TIMESTAMP
  );

-- Asserts that the timestamp is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIMESTAMP_NOT_NULL (
  IN VALUE TIMESTAMP
  );

-- Asserts that the timestamp is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIMESTAMP_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE TIMESTAMP
  );

-- DATETIMES (DATE)

-- Asserts equals two dates.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DATE_EQUALS (
  IN EXPECTED DATE,
  IN ACTUAL DATE
  );

-- Asserts equals two dates with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DATE_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED DATE,
  IN ACTUAL DATE
  );

-- Asserts that the dates is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DATE_NULL (
  IN VALUE DATE
  );

-- Asserts that the dates is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DATE_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE DATE
  );

-- Asserts that the dates is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DATE_NOT_NULL (
  IN VALUE DATE
  );

-- Asserts that the dates is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_DATE_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE DATE
  );

-- DATETIMES (TIME)

-- Asserts equals two times.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIME_EQUALS (
  IN EXPECTED TIME,
  IN ACTUAL TIME
  );

-- Asserts equals two times with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIME_EQUALS (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN EXPECTED TIME,
  IN ACTUAL TIME
  );

-- Asserts that the times is null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIME_NULL (
  IN VALUE TIME
  );

-- Asserts that the times is null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIME_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE TIME
  );

-- Asserts that the times is not null.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIME_NOT_NULL (
  IN VALUE TIME
  );

-- Asserts that the times is not null with a given message.
ALTER MODULE DB2UNIT PUBLISH
  PROCEDURE ASSERT_TIME_NOT_NULL (
  IN MESSAGE ANCHOR MAX_VALUES.MESSAGE_ASSERT,
  IN VALUE TIME
  );
