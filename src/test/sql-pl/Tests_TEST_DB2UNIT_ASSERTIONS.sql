--#SET TERMINATOR @

/*
Copyright (c) 2014-2014 Andres Gomez Casanova (AngocA).

All rights reserved. This program and the accompanying materials
are made available under the terms of the Eclipse Public License v1.0
which accompanies this distribution, and is available at
http://www.eclipse.org/legal/epl-v10.html -->

Contributors:
Andres Gomez Casanova - initial API and implementation.
*/

SET CURRENT SCHEMA TEST_DB2UNIT_ASSERTIONS @

SET PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM", DB2UNIT_1A, TEST_DB2UNIT_ASSERTIONS @

/**
 * Tests for assertions.
 *
 * Version: 2014-05-01 1-Alpha
 * Author: Andres Gomez Casanova (AngocA)
 * Made in COLOMBIA.
 */

-- Previously create the table in order to compile these tests.
CREATE TABLE REPORT_TESTS LIKE DB2UNIT_1A.REPORT_TESTS @

-- Tests that no message is inserted in the report when two strings are equals.
CREATE OR REPLACE PROCEDURE TEST_1()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'Message check';
  INSERT INTO TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS (DATE, EXECUTION_ID,
    TEST_NAME, MESSAGE) VALUES (CURRENT TIMESTAMP, 0, '', EXPECTED_MSG);
  SET STR_1 = 'String';
  SET STR_2 = 'String';
  CALL DB2UNIT.ASSERT(STR_1, STR_2);
  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE EXECUTION_ID = 0
    AND MESSAGE = EXPECTED_MSG;
 END@

-- Test two different strings with same length.
CREATE OR REPLACE PROCEDURE TEST_2()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'The content of both strings is different';
  SET STR_1 = 'String1';
  SET STR_2 = 'String2';
  CALL DB2UNIT.ASSERT(STR_1, STR_2);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Actual  : "String2"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);
  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Expected: "String1"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE)
      FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = EXPECTED_MSG
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
 END@

-- Test two different strings, the first being longer than the second one.
CREATE OR REPLACE PROCEDURE TEST_3()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'Strings have different lengths';
  SET STR_1 = 'String-LONG';
  SET STR_2 = 'String';
  CALL DB2UNIT.ASSERT(STR_1, STR_2);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Actual  : "String"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);
  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Expected: "String-LONG"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE)
      FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = EXPECTED_MSG
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
 END@

-- Test two different strings, the second being longer than the first one.
CREATE OR REPLACE PROCEDURE TEST_4()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'Strings have different lengths';
  SET STR_1 = 'String';
  SET STR_2 = 'String-LONG';
  CALL DB2UNIT.ASSERT(STR_1, STR_2);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Actual  : "String-LONG"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);
  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Expected: "String"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE)
      FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = EXPECTED_MSG
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
 END@

-- Test both strings as null.
CREATE OR REPLACE PROCEDURE TEST_6()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'Executing TEST_6';
  SET STR_1 = NULL;
  SET STR_2 = NULL;
  CALL DB2UNIT.ASSERT(STR_1, STR_2);

  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE)
      FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
 END@

-- Test first string as null.
CREATE OR REPLACE PROCEDURE TEST_7()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'Nullability difference';
  SET STR_1 = NULL;
  SET STR_2 = 'String';
  CALL DB2UNIT.ASSERT(STR_1, STR_2);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Actual  : "String"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);
  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Expected: NULL'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE)
      FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = EXPECTED_MSG
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
 END@

-- Test second string as null.
CREATE OR REPLACE PROCEDURE TEST_5()
 BEGIN
  DECLARE ACTUAL_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE EXPECTED_MSG ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_1 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;
  DECLARE STR_2 ANCHOR DB2UNIT_1A.REPORT_TESTS.MESSAGE;

  SET EXPECTED_MSG = 'Nullability difference';
  SET STR_1 = 'String';
  SET STR_2 = NULL;
  CALL DB2UNIT.ASSERT(STR_1, STR_2);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Actual  : NULL'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);
  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = 'Expected: "String"'
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  SELECT MESSAGE INTO ACTUAL_MSG
    FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE DATE = (SELECT MAX(DATE)
      FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  DELETE FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS
    WHERE MESSAGE = EXPECTED_MSG
    AND DATE = (SELECT MAX(DATE) FROM TEST_DB2UNIT_ASSERTIONS.REPORT_TESTS);

  CALL DB2UNIT.ASSERT(EXPECTED_MSG, ACTUAL_MSG);
 END@
