<?php

require_once("database.php");

class Ingredient {
    public function assembleIngredients ($row, $lang) {
        $database = new Database();		
		$database->connectDB();
        $ingredientsQuery = "";
        $ingredients = [];

        if ($lang != "hr") {
            $ingredientsQuery = "SELECT ingredient_".$lang.".id AS ingID, ingredient_".$lang.".title AS ingTitle, ingredient_hr.slug AS ingSlug "
            ."FROM ingredient_".$lang." INNER JOIN ingredient_hr ON ingredient_hr.id=ingredient_".$lang.".id "
            ."INNER JOIN meal_has_ingredient ON ingredient_id=ingredient_hr.id WHERE meal_id=".$row["id"];
        } else {
            $ingredientsQuery = "SELECT ingredient_hr.id AS ingID, ingredient_hr.title AS ingTitle, ingredient_hr.slug AS ingSlug "
            ."FROM ingredient_hr INNER JOIN meal_has_ingredient ON ingredient_id=id WHERE meal_id=".$row["id"];
        }

        $ingredientData = $database->selectDB($ingredientsQuery);
        while ($ingredientRow = mysqli_fetch_assoc($ingredientData)) {
            array_push(
                $ingredients,
                [
                    "id" => $ingredientRow["ingID"],
                    "title" => $ingredientRow["ingTitle"],
                    "slug" => $ingredientRow["ingSlug"]
                ]
            );
        }

        return $ingredients;
    }
}