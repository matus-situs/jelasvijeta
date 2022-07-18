<?php

require_once("database.php");

class QueryAssembler {
    public function assembleBase($lang) {
        $query = "SELECT *, meal_".$lang.".title AS meal_title_".$lang." FROM meal_".$lang;

		if ($lang != "hr") {
			$query .= " INNER JOIN meal_hr ON meal_hr.id=meal_".$lang.".id";
		}
		
		$query .= " WHERE";
        return $query;
    }

    public function assembleTime($diff_time) {
        $return = "";
        if ($diff_time == null) {
			$return = " deleted_at IS NULL";
		} else {
			$return = " (created_at > '".$diff_time."' OR deleted_at > '".$diff_time."' OR updated_at > '".$diff_time."')";
		}
        return $return;
    }

    public function assembleCategory($category) {
        $return = "";
        switch ($category) {
			case "none":
                return;
			case "null":
				$return = " AND category_id IS null";
                break;
			case "!null":
				$return = " AND category_id IS not null";
                break;
			default:
				$return = " AND category_id=".$category;
                break;
		}
        return $return;
    }

    public function assembleTags($tags, $query) {
        $return = "";

		if (count($tags) > 0){
            $database = new Database();		
		    $database->connectDB();

            $mealID = array();

		    $data = $database->selectDB($query);

			while($row = mysqli_fetch_assoc($data)) {
				$hasAllTags = true;

				for ($i = 0; $i < count($tags); $i++) {
					$tagQuery = "SELECT * FROM meal_has_tag WHERE meal_id=".$row["id"]." AND tag_id=".$tags[$i];
					$tagData = $database->selectDB($tagQuery);
					if (mysqli_num_rows($tagData) == null) {
						$hasAllTags = false;
						break;
					}
				}

				if ($hasAllTags) {
					array_push($mealID, $row["id"]);
				}
			}
	
			if (count($mealID) > 0) {
				$return .= " AND (meal_hr.id=".$mealID[0];
				foreach ($mealID as $mealTag) {
					$return .= " OR  meal_hr.id=".$mealTag;
				}		
				$return .= ")";	
			} else {
				$return .= " AND meal_hr.id=-1";
			}
		}
        return $return;
    }
}