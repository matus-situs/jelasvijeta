<?php

require_once("database.php");

class Category {
    public function assembleCategory ($row, $lang) {
        $database = new Database();		
		$database->connectDB();
        $category = null;

        if (!empty($row["Category_id"])) {
            $categoryQuery = "";

            if ($lang != "hr") {
                $categoryQuery = "SELECT category_".$lang.".id AS categoryID, category_".$lang.".title AS categoryTitle, "
                ."category_hr.slug AS categorySlug FROM category_".$lang." INNER JOIN category_hr ON category_hr.id=category_".$lang.".id "
                ."WHERE category_hr.id=".$row["Category_id"];
            } else {
                $categoryQuery = "SELECT category_hr.id AS categoryID, category_hr.title AS categoryTitle, "
                ."category_hr.slug AS categorySlug FROM category_hr WHERE category_hr.id=".$row["Category_id"];
            }
            
            $categoryData = $database->selectDB($categoryQuery);
            $categoryRow = mysqli_fetch_assoc($categoryData);

            $category = [
                "id" => $categoryRow["categoryID"],
                "title" => $categoryRow["categoryTitle"],
                "slug" => $categoryRow["categorySlug"]
            ];
        }

        return $category;
    }
}