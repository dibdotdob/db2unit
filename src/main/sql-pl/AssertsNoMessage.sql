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

SET CURRENT SCHEMA DB2UNIT_1A @

/**
 * Asserts implementation.
 *
 * Version: 2014-05-04 1-Alpha
 * Author: Andres Gomez Casanova (AngocA)
 * Made in COLOMBIA.
 */

-- STRING

/**
 * Asserts if the given two strings are the same, in nullability, in length and
 * in content.
 *
 * IN EXPECTED
 *   Expected string.
 * IN ACTUAL
 *   Actual string.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_STRING_EQUALS (
  IN EXPECTED ANCHOR DB2UNIT_1A.MAX_STRING.STRING,
  IN ACTUAL ANCHOR DB2UNIT_1A.MAX_STRING.STRING
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_STRING_EQUALS
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_STRING_EQUALS: BEGIN
  DECLARE RET INT;

  CALL ASSERT_STRING_EQUALS(NULL, EXPECTED, ACTUAL);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_STRING_EQUALS @

/**
 * Asserts if the given string is null.
 *
 * IN STRING
 *   Value to check if it is null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_STRING_NULL (
  IN STRING ANCHOR DB2UNIT_1A.MAX_STRING.STRING
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_STRING_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_STRING_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_STRING_NULL(NULL, STRING);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_STRING_NULL @

/**
 * Asserts if the given string is not null.
 *
 * IN STRING
 *   Value to check if it is not null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_STRING_NOT_NULL (
  IN STRING ANCHOR DB2UNIT_1A.MAX_STRING.STRING
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_STRING_NOT_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_STRING_NOT_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_STRING_NOT_NULL(NULL, STRING);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_STRING_NOT_NULL @

-- BOOLEAN

/**
 * Asserts if the given two booleans are equal.
 *
 * IN EXPECTED
 *   Expected boolean.
 * IN ACTUAL
 *   Actual boolean.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_BOOLEAN_EQUALS (
  IN EXPECTED BOOLEAN,
  IN ACTUAL BOOLEAN
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_BOOLEAN_EQUALS
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_BOOLEAN_EQUALS: BEGIN
  DECLARE RET INT;

  CALL ASSERT_BOOLEAN_EQUALS(NULL, EXPECTED, ACTUAL);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_BOOLEAN_EQUALS @

/**
 * Asserts if the given value is true.
 *
 * IN CONDITION
 *   Value to check against TRUE.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_BOOLEAN_TRUE (
  IN CONDITION BOOLEAN
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_BOOLEAN_TRUE
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_BOOLEAN_TRUE: BEGIN
  DECLARE RET INT;

  CALL ASSERT_BOOLEAN_TRUE(NULL, CONDITION);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_BOOLEAN_TRUE @

/**
 * Asserts if the given value is false.
 *
 * IN CONDITION
 *   Value to check against FALSE.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_BOOLEAN_FALSE (
  IN CONDITION BOOLEAN
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_BOOLEAN_FALSE
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_BOOLEAN_FALSE: BEGIN
  DECLARE RET INT;

  CALL ASSERT_BOOLEAN_FALSE(NULL, CONDITION);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_BOOLEAN_FALSE @

/**
 * Asserts if the given boolean is null.
 *
 * IN CONDITION
 *   Value to check if it is null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_BOOLEAN_NULL (
  IN CONDITION BOOLEAN
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_BOOLEAN_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_BOOLEAN_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_BOOLEAN_NULL(NULL, CONDITION);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_BOOLEAN_NULL @

/**
 * Asserts if the given boolean is not null.
 *
 * IN CONDITION
 *   Value to check if it is not null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_BOOLEAN_NOT_NULL (
  IN CONDITION BOOLEAN
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_BOOLEAN_NOT_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_BOOLEAN_NOT_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_BOOLEAN_NOT_NULL(NULL, CONDITION);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_BOOLEAN_NOT_NULL @

-- INTEGER

/**
 * Asserts if the given two integers are equal.
 *
 * IN EXPECTED
 *   Expected integer.
 * IN ACTUAL
 *   Actual integer.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_INT_EQUALS (
  IN EXPECTED BIGINT,
  IN ACTUAL BIGINT
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_INT_EQUALS
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_INT_EQUALS: BEGIN
  DECLARE RET INT;

  CALL ASSERT_INT_EQUALS(NULL, EXPECTED, ACTUAL);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_INT_EQUALS @

/**
 * Asserts if the given int is null.
 *
 * IN VALUE
 *   Value to check if it is null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_INT_NULL (
  IN VALUE BIGINT
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_INT_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_INT_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_INT_NULL(NULL, VALUE);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_INT_NULL @

/**
 * Asserts if the given int is not null.
 *
 * IN VALUE
 *   Value to check if it is not null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_INT_NOT_NULL (
  IN VALUE BIGINT
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_INT_NOT_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_INT_NOT_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_INT_NOT_NULL(NULL, VALUE);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_INT_NOT_NULL @

-- DECIMAL

/**
 * Asserts if the given two decimals are equal.
 *
 * IN EXPECTED
 *   Expected decimal.
 * IN ACTUAL
 *   Actual decimal.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_DEC_EQUALS (
  IN EXPECTED DECFLOAT,
  IN ACTUAL DECFLOAT
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_DEC_EQUALS
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_DEC_EQUALS: BEGIN
  DECLARE RET INT;

  CALL ASSERT_DEC_EQUALS(NULL, EXPECTED, ACTUAL);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_DEC_EQUALS @

/**
 * Asserts if the given decimals is null.
 *
 * IN VALUE
 *   Value to check if it is null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_DEC_NULL (
  IN VALUE DECFLOAT
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_DEC_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_DEC_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_DEC_NULL(NULL, VALUE);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_DEC_NULL @

/**
 * Asserts if the given decimals is not null.
 *
 * IN VALUE
 *   Value to check if it is not null.
 */
ALTER MODULE DB2UNIT ADD
  PROCEDURE ASSERT_DEC_NOT_NULL (
  IN VALUE DECFLOAT
  )
  LANGUAGE SQL
  SPECIFIC P_ASSERT_DEC_NOT_NULL
  DYNAMIC RESULT SETS 0
  MODIFIES SQL DATA
  NOT DETERMINISTIC
  NO EXTERNAL ACTION
  PARAMETER CCSID UNICODE
 P_ASSERT_DEC_NOT_NULL: BEGIN
  DECLARE RET INT;

  CALL ASSERT_DEC_NOT_NULL(NULL, VALUE);

  GET DIAGNOSTICS RET = DB2_RETURN_STATUS;

  RETURN RET;
 END P_ASSERT_DEC_NOT_NULL @

