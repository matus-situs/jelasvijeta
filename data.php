<?php

require_once("database.php");
require_once("query_assembler.php");
require_once("json_assembler.php");

class Data {
    public function fetchData($lang, $per_page, $tags, $with, $category, $diff_time, $page){
		$queryAssembler = new QueryAssembler();
		$JSONassembler = new JSONAssembler();
		$link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

		$query = $queryAssembler->assembleBase($lang);
		$query .= $queryAssembler->assembleTime($diff_time);
		$query .= $queryAssembler->assembleCategory($category);
		$query .= $queryAssembler->assembleTags($tags, $query);

		$mainJSON = $JSONassembler->assembleJSON($with, $query, $lang, $page, $per_page, $link);

		return $mainJSON;
    }
}