<?php

require_once("database.php");
require_once("category.php");
require_once("tag.php");
require_once("ingredient.php");

class JSONAssembler {
    public function assembleJSON ($with, $query, $lang, $page, $per_page, $link) {
        $database = new Database();
        $category = new Category();
        $ingredients = new Ingredient();
        $tags = new Tag();
        $mealsData = [];
        $categoryData = [];
        $tagsData = [];
        $ingredientsData = [];

		$database->connectDB();
        $data = $database->selectDB($query);
        $meta = $this->assembleMeta($page, $per_page, mysqli_num_rows($data));

		while ($row = mysqli_fetch_assoc($data)) {
			$export = 0;
			if (in_array("category", $with)) {
                $categoryData = $category->assembleCategory($row, $lang);
				$export += 4;
			}
            if (in_array("tags", $with)) {
                $tagsData = $tags->assembleTags($row, $lang);
                $export += 2;
            }
            if (in_array("ingredients", $with)) {
                $ingredientsData = $ingredients->assembleIngredients($row, $lang);
                $export += 1;
            }
            $mealData = $this->assembleMeal($row, $categoryData, $tagsData, $ingredientsData, $export, $lang);
            array_push($mealsData, $mealData);
		}

        $linksData = $this->assembleLinks($link, mysqli_num_rows($data), $per_page, $page);
        $mainJSON = [
            "meta" => $meta,
            "data" => $mealsData,
            "links" => $linksData
        ];
        return json_encode($mainJSON);
    }

    private function assembleMeta ($page, $per_page, $numOfResults) {
        $meta = [];
        $numOfPages = 1;
        if ($page != null) {
            if ($page > $numOfPages) {
                $page = $numOfPages;
            }
            $meta += [
                "currentPage" => $page
            ];
        }
        if ($per_page != null) {
            $numOfPages = ceil($numOfResults/$per_page);
            $meta += [
                "itemsPerPage" => $per_page
            ];
        }
        $meta += [
            "totalItems" => $numOfResults,
            "totalPages" => $numOfPages
        ];
        return $meta;
    }

    private function assembleMeal ($row, $categoryData, $tagsData, $ingredientsData, $export, $lang) {
        $status = "created";
        if (empty($row["deleted_at"])) {
            $status = "deleted";
        }
        $mealData = [
            "id" => $row["id"],
            "title" => $row["meal_title_".$lang],
            "status" => $status
        ];
        if ($export >= 4) {
            $mealData += [
                "category" => $categoryData
            ];
            $export -= 4;
        }
        if ($export >= 2) {
            $mealData += [
                "tags" => $tagsData
            ];
            $export -= 2;
        }
        if ($export >= 1) {
            $mealData += [
                "ingredients" => $ingredientsData
            ];
            $export -= 1;
        }
        return $mealData;
    }

    private function assembleLinks ($link, $numOfResults, $per_page, $page) {
        $next = null;
        $prev = null;
        $self = $link;
        $numOfPages = 1;
        if ($per_page != null) {
            $numOfPages = ceil($numOfResults/$per_page);
        }
        if (!empty($page)) {
            $pagePosition = strpos($link, "&page");
            $pagePosition += 6;
            $num = (int)substr($link, $pagePosition, 1);
            switch ($page) {
                case ($page == 1 && $numOfPages > 1):
                    $replaceLink = $link;
                    $replaceLink = str_replace("&page=".$num, "&page=".$num+1, $replaceLink);
                    $next = $replaceLink;
                    break;
                case ($page == $numOfPages && $numOfPages > 1):
                    $replaceLink = $link;
                    $replaceLink = str_replace("&page=".$num, "&page=".$num-1, $replaceLink);
                    $prev = $replaceLink;
                    break;
                case ($page > 1 && $page < $numOfPages):
                    $replaceLinkNext = $link;
                    $replaceLinkPrev = $link;
                    $replaceLinkNext = str_replace("&page=".$num, "&page=".$num+1, $replaceLinkNext);
                    $next = $replaceLinkNext;
                    $replaceLinkPrev = str_replace("&page=".$num, "&page=".$num-1, $replaceLinkPrev);
                    $prev = $replaceLinkPrev;
                    break;
            }
        }
        $links = [
            "prev" => $prev,
            "next" => $next,
            "self" => $self
        ];
        return $links;
    }
}