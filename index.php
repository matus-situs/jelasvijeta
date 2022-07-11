<?php
require_once("baza.class.php");
require_once("validator.class.php");
require_once("podaci.class.php");

$baza = new Baza();
$baza->spojiDB();
$validator = new Validator;

if(isset($_GET["lang"])){
	try{
		if(isset($_GET["page"])) {
			$validator->jeBroj($_GET["page"]);
			$validator->isNegative($_GET["page"]);
		}		
		if(isset($_GET["page"])) {
			$validator->jeBroj($_GET["per_page"]);
			$validator->isNegative($_GET["per_page"]);
		}
		$validator->validString($_GET["tag"]);
		$validator->validString($_GET["lang"]);
		$validator->validString($_GET["c"]);
		$validator->validateDate($_GET["diff_time"]);
		$validator->validString($_GET["diff_time"]);

		$upravljanjePodacima=new Podaci;

		if(!isset($_GET["page"])) $_GET["page"]=NULL;
		if(!isset($_GET["per_page"])) $_GET["per_page"]=NULL;
		if(!isset($_GET["tags"])) $_GET["tags"]=NULL;
		if(!isset($_GET["ingredients"])) $_GET["ingredients"]=NULL;
		if(!isset($_GET["category"])) $_GET["category"]=NULL;
		if(!isset($_GET["tag"])) $_GET["tag"]=NULL;
		if(!isset($_GET["c"])) $_GET["c"]=NULL;

		echo $upravljanjePodacima->dohvatiPodatke($_GET["page"], $_GET["per_page"], $_GET["tags"], $_GET["ingredients"], $_GET["category"], $_GET["tag"], $_GET["c"], $_GET["diff_time"],  $_GET["lang"]);	
	}
	catch (Exception $e){
		echo $e->getMessage();
	}	
}

$baza->zatvoriDB();
?>