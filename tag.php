<?php

require_once("database.php");

class Tag {
    public function assembleTags ($row, $lang) {
        $database = new Database();		
		$database->connectDB();
        $tagsQuery = "";
        $tags = [];
        
        if ($lang != "hr") {
            $tagsQuery = "SELECT tag_".$lang.".id AS tagID, tag_".$lang.".title AS tagTitle, tag_hr.slug AS tagSlug"
            ." FROM tag_".$lang." INNER JOIN meal_has_tag ON tag_id=id INNER JOIN tag_hr ON tag_hr.id=tag_".$lang.".id"
            ." WHERE meal_id=".$row["id"];
        } else {
            $tagsQuery = "SELECT tag_hr.id AS tagID, tag_hr.title AS tagTitle, tag_hr.slug AS tagSlug"
            ." FROM tag_hr INNER JOIN meal_has_tag ON tag_id=id WHERE meal_id=".$row["id"];
        }
        
        $tagData = $database->selectDB($tagsQuery);
        while ($tagRow = mysqli_fetch_assoc($tagData)) {
            array_push(
                $tags,
                [
                    "id" => $tagRow["tagID"],
                    "title" => $tagRow["tagTitle"],
                    "slug" => $tagRow["tagSlug"]
                ]
            );
        }

        return $tags;
    }
}