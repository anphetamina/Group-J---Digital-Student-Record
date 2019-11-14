<?php

require_once 'testConfig.php';
// todo rearrange this for our project

/**
 * To be used in setUp() and tearDown() methods for tests
 *
 * @param null
 *
 * @return null
 */
function createTestDatabase() {
    $filename = 'testDBsetup.sql';

    $mysqli = new mysqli(DBAddrTest, DBUserTest, DBPasswordTest);

    if ($mysqli->connect_errno) {
        printf("Connect failed: %s\n", $mysqli->connect_errno);
    }
    $mysqli->query("CREATE DATABASE testsofteng2;");
    $mysqli->query("USE testsofteng2;");
    $templine = '';
    $lines = file($filename);

    foreach ($lines as $line) {
        if (substr($line, 0, 2) == '--' || $line == '')
            continue;

        $templine .= $line;

        if (substr(trim($line), -1, 1) == ';') {
            $mysqli->query($templine) or print('Error performing query \'< strong>' . $templine . '\': ' . $mysqli->error . '<br /><br />');

            $templine = '';
        }
    }

    $mysqli->close();
    return;
}

/**
 * To be used in setUp() and tearDown() methods for tests
 *
 * @param null
 *
 * @return null
 */
function dropTestDatabase() {
    $mysqli = TestsConnectMySQL();

    if ($mysqli->query("DROP DATABASE " . DBNameTest) === TRUE)
        echo "Database " . DBNameTest . " dropped successfully";
    else
        echo "Unable to drop database " . DBNameTest . ". ERROR: " . $mysqli->error;
}

/**
 * @param the query you want to perform (SELECT **aggregate function** ... >> NO GROUP BY
 *
 * @return value returned by the query
 */
function perform_SELECT_return_single_value($sql) {
    $conn = TestsConnectMySQL();

    if ($result = $conn->query($sql)) {
        $row = $result->fetch_array();
        $value = $row[0];

        $result->close();
        return  $value;
    } else {
        printf("Error message: %s\n", $conn->error);
    }
}

/**
 * @param query you want to perform containing --only-- INSERT or DELETE statement
 *
 * @return bool according if the operation succeded
 */
function perform_INSERT_or_DELETE($sql) {
    $conn = TestsConnectMySQL();

    if ($result = $conn->query($sql)) {
        return true;
    }
    else {
        printf("Error message: %s\n", $conn->error);
        return false;
    }
}

/**
 * Creates a connection to the DB for testing
 * Connection is to be closed by the caller function
 *
 * @param null
 *
 * @return mysqli connection
 */
function TestsConnectMySQL() {
    $mysqli = new mysqli(DBAddrTest, DBUserTest, DBPasswordTest, DBNameTest);
    /* check connection */
    if ($mysqli->connect_errno) {
        printf("Connect failed: %s\n", $mysqli->connect_errno);
        exit();
    }
    return $mysqli;
}

function get_serviceID_by_service_name($service_name) {
    return perform_SELECT_return_single_value("SELECT ID FROM Service WHERE Name = '{$service_name}'");
}

// protected and not private so that every inheriting class can access this method
function connectMySQLTests() {
    $mysqli = new mysqli(DBAddr, DBUser, DBPassword, DBName);
    /* check connection */
    if ($mysqli->connect_errno) {
        printf("Connect failed: %s\n", $mysqli->connect_errno);
        exit();
    }
    return $mysqli;
}