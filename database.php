<?php

class Database {

    const server = "localhost";
    const user = "root";
    const password = "";
    const Database = "jela_svijeta";

    private $connection = null;
    private $error = '';

    function connectDB() {
        $this->connection = new mysqli(self::server, self::user, self::password, self::Database);
        if ($this->connection->connect_errno) {
            echo "Failed connection to database: " . $this->connection->connect_errno . ", " .
            $this->connection->connect_error;
            $this->error = $this->connection->connect_error;
        }
        $this->connection->set_charset("utf8");
        if ($this->connection->connect_errno) {
            echo "Failed to put data to database: " . $this->connection->connect_errno . ", " .
            $this->connection->connect_error;
            $this->error = $this->connection->connect_error;
        }
        return $this->connection;
    }

    function disconnectDB() {
        $this->connection->close();
    }

    function selectDB($query) {
        $rezultat = $this->connection->query($query);
        if ($this->connection->connect_errno) {
            echo "Query error: {$query} - " . $this->connection->connect_errno . ", " .
            $this->connection->connect_error;
            $this->error = $this->connection->connect_error;
        }
        if (!$rezultat) {
            $rezultat = null;
        }
        return $rezultat;
    }

    function updateDB($query, $skripta = '') {
        $rezultat = $this->connection->query($query);
        if ($this->connection->connect_errno) {
            echo "Query error: {$query} - " . $this->connection->connect_errno . ", " .
            $this->connection->connect_error;
            $this->error = $this->connection->connect_error;
        } else {
            if ($skripta != '') {
                header("Location: $skripta");
            }
        }

        return $rezultat;
    }

    function errorDB() {
        if ($this->error != '') {
            return true;
        } else {
            return false;
        }
    }

}

?>