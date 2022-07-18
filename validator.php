<?php

require_once("database.php");

class Validator {
    public function isLang ($lang) {
        $database = new Database();
        $database->connectDB();

        $query = "SELECT * FROM lang WHERE title='".$lang."'";
        $data = $database->selectDB($query);

        if (mysqli_num_rows($data) == 1) {
            return true;
        } else {
            throw new Exception("Content of lang parameter does not exist in database");
        }
    }

    public function validString ($text, $parameter) {
        if (strpos($text, "<") !==false || strpos($text, ">") !==false || strpos($text, "'") !==false || strpos($text, '"') !==false) {
            throw new Exception("Paremeter string '".$parameter."' must not contain symbols: <, >, ', "."'");
        } else{
            return true;
        }
    }

    public function isNum ($num, $parameter) {
        if (ctype_digit($num)) {
            return true;
        } else {
            throw new Exception("Parameter '".$parameter."' has to be a a number");
        }
    }

    public function isPositive ($num, $parameter) {
        if ($num < 0) {
            throw new Exception("Parameter '".$parameter."' has to be positive number");
        } elseif ($num == 0) {
            throw new Exception("Parameter '".$parameter."' has to be greater than 0");
        } else {
            return true;
        }
    }

    public function validTags ($tags) {
        $tags = explode(",", $tags);

        for ($i = 0; $i < count($tags); $i ++) {
            $this->isNum($tags[$i], "Tag -> ".$tags[$i]);
        }

        return $tags;
    }

    public function validWith ($with) {
        $returnWith = array();
        $with = explode(",", $with);

        if (in_array("ingredients", $with)) {
            array_push($returnWith, "ingredients");
        }
        if (in_array("category", $with)) {
            array_push($returnWith, "category");
        }
        if (in_array("tags", $with)) {
            array_push($returnWith, "tags");
        }

        return $returnWith;
    }

    public function isNull ($category) {
        $category = strtolower($category);
        if ($category == "null" || $category == "!null") {
            return true;
        } else {
            return false;
        }
    }
    
    function validDate($date, $format = 'Y-m-d')
    {
        $d = DateTime::createFromFormat($format, $date);

        if(!($d && $d->format($format) === $date)){
            throw new Exception("Wrong date format, correct format is Y-m-d");
        } else {
            return true;
        }
    }
}
