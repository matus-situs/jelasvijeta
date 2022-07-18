<?php
require_once("database.php");
require_once("validator.php");
require_once("data.php");

$database = new Database();
$database->connectDB();
$validator = new Validator();
$fetchData = new Data();

if (isset($_GET["lang"])) {
	try {
		$per_page = null;
		$tags = array();
		$with = array();
		$category = "none";
		$diff_time = null;
		$page = null;

		if ($validator->validString($_GET["lang"], "lang") && $validator->isLang($_GET["lang"])) {
			$lang = $_GET["lang"];
		}

		if (isset($_GET["per_page"]) && $validator->isNum($_GET["per_page"], "per_page") && $validator->isPositive($_GET["per_page"], "per_page")) {
			$per_page = $_GET["per_page"];
		}

		if (isset($_GET["tags"]) && $validator->validString($_GET["tags"], "tags")) {
			$tags = $validator->validTags($_GET["tags"]);
		}

		if (isset($_GET["with"]) && $validator->validString($_GET["with"], "with")) {
			$with = $validator->validWith($_GET["with"]);
		}

		if (isset($_GET["category"])) {
			if ($validator->isNull($_GET["category"])) {
				$category = strtolower($_GET["category"]);
			} else if ($validator->isNum($_GET["category"], "category") && $validator->isPositive($_GET["category"], "category")) {
				$category = strtolower($_GET["category"]);
			}
		}

		if (isset($_GET["diff_time"]) && $validator->validString($_GET["diff_time"], "diff_time") && $validator->validDate($_GET["diff_time"])) {
			$diff_time = $_GET["diff_time"];
		}

		if (isset($_GET["page"]) && $validator->isNum($_GET["page"], "page") && $validator->isPositive($_GET["page"], "page")) {
			$page = $_GET["page"];
		}

		echo $fetchData->fetchData($lang, $per_page, $tags, $with, $category, $diff_time, $page);

	} catch (Exception $e) {
		echo $e->getMessage();
	}	
} else{
	echo "Parameter 'lang' has to be set!";
}