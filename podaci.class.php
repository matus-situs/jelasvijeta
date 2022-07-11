<?php

require_once("baza.class.php");

class Podaci{
    function dohvatiPodatke($str, $postr, $tagiranje, $ingredients, $category, $tag, $c, $vrijeme, $jezik){
        $baza = new Baza;
        $baza->spojiDB();

		$upitJela = "SELECT *, meal.id AS mealID, meal.title AS mealTitle FROM meal";

		if($jezik=="hr") $jezik=NULL;
		if($tag!="sve" && $tag!=NULL) $upitJela .= " INNER JOIN meal_has_tag ON meal.id=meal_id";
		if($c!=NULL && $c!="sve")  $upitJela .= " LEFT JOIN category ON category.id=meal.category_id";
		if($tag!="sve" && $tag!=NULL){
			$upitJela .= " WHERE tag_id=".$tag;
			if($c!=NULL && $c!="sve"){
				switch($c){
					case "null": $upitJela.=" AND category_id IS NULL";break;
					case "!null": $upitJela.=" AND category_id IS NOT NULL";break;
					default: $upitJela.=" AND category_id=".$c;
				}	
				$upitJela.=" AND (created_at > '".$vrijeme."' OR updated_at > '".$vrijeme."' OR deleted_at > '".$vrijeme."')";						
			}
		}
			else{
				$g=false;
				switch($c){
					case "sve":$g=true;break;
					case "null":$upitJela.=" WHERE category_id IS NULL";break;
					case "!null":$upitJela.=" WHERE category_id IS NOT NULL";break;
					default: $upitJela.=" WHERE category_id=".$c;
				}
				if(!$g){
					$upitJela.=" AND (created_at > '".$vrijeme."' OR updated_at > '".$vrijeme."' OR deleted_at > '".$vrijeme."')";	
				}
				if($g){
					$upitJela.=" WHERE (created_at > '".$vrijeme."' OR updated_at > '".$vrijeme."' OR deleted_at > '".$vrijeme."')";	
				}			
		}	

        $podaci = $baza->selectDB($upitJela);
		$brojRezultata= mysqli_num_rows($podaci);
		$stranica="";
		$rezultatiPoStranici="";
		$ukupnoStranica="";

		$ispis = array();
		$meta = array();
		if($str>0) {
			$stranica=$str;
		}
		if($postr>0) {
			$rezultatiPoStranici=$postr;
		}
		if($postr!=NULL) $ukupnoStranica = ceil($brojRezultata/$rezultatiPoStranici);

		array_push($meta, ["page" => $stranica, "per_page" => $rezultatiPoStranici, "itemsPerPage" => $brojRezultata, "totalPages" => $ukupnoStranica]);

		$jelo= array();
		while($red=mysqli_fetch_assoc($podaci)){
			$tagovi=array();
			$sastojci=array();
			$kategorija="";
			
			if($category!=NULL){
				$kategorija=$this->dohvatiKategoriju($red["id"]);
			}
            
			if($ingredients!=NULL){
				$sastojci=$this->dohvatiSastojke($red["id"], $jezik);
			}            

			if($tagiranje!=NULL){
				$tagovi=$this->dohvatiTagove($red["id"]);
			}

			if($jezik!=NULL && $jezik!="hr"){
				$stranoJelo="SELECT * FROM meal INNER JOIN meal_".$jezik." ON meal_".$jezik.".id=meal.title_".$jezik."_id WHERE meal.id=".$red["mealID"];
				$straniPodaci=$baza->selectDB($stranoJelo);
				$strano=mysqli_fetch_assoc($straniPodaci);
				array_push($jelo, ["id" => $red["mealID"], "title_".$jezik => $strano["title_".$jezik], "category" => $kategorija, "status" => $red["status"], "created_at" => $red["created_at"], 
				"updated_at" => $red["updated_at"], "deleted_at" => $red["deleted_at"], "ingredients" => $sastojci, "tags" => $tagovi]);
			}
			else{
				array_push($jelo, ["id" => $red["mealID"], "title_hr" => $red["mealTitle"], "category" => $kategorija, "status" => $red["status"], "created_at" => $red["created_at"], 
				"updated_at" => $red["updated_at"], "deleted_at" => $red["deleted_at"], "ingredients" => $sastojci, "tags" => $tagovi]);
			}
		}
		array_push($ispis, ["meta" => $meta, "data" => $jelo]);

		return json_encode($ispis);
    }

	function dohvatiSastojke($id, $jezik){
        $baza = new Baza;
        $baza->spojiDB();
		if($jezik!=NULL){
			$upitSastojci = "SELECT *, ingredient_".$jezik.".id AS ingID, ingredient_".$jezik.".title_".$jezik." AS ingTitle FROM meal_has_ingredient "
			."INNER JOIN ingredient ON ingredient.id=ingredient_id INNER JOIN ingredient_".$jezik." ON ingredient.id=ingredient_".$jezik.".id "
			."INNER JOIN meal ON meal.id=meal_id INNER JOIN meal_".$jezik." ON meal.title_".$jezik."_id=meal_".$jezik.".id WHERE meal_id=".$id;
		}
		else{
			$upitSastojci ="SELECT * FROM meal_has_ingredient INNER JOIN ingredient ON ingredient.id=meal_has_ingredient.ingredient_id WHERE meal_id=".$id;
		}
        
		$podaciSastojaka=$baza->selectDB($upitSastojci);
		$sastojci=array();

		while($sastojak=mysqli_fetch_assoc($podaciSastojaka)){
			if($jezik!=NULL){
				array_push($sastojci, ["id" => $sastojak["ingID"], "title_".$jezik => $sastojak["ingTitle"], "slug" => $sastojak["slug"]]);
			}
			else{
				array_push($sastojci, ["id" => $sastojak["id"], "title_hr" => $sastojak["title"], "slug" => $sastojak["slug"]]);
			}		    
		}
        return $sastojci;
    }

	function dohvatiTagove($id){
		$baza = new Baza;
        $baza->spojiDB();
		$upitTagova = "SELECT * FROM meal_has_tag INNER JOIN tag ON tag.id=tag_id WHERE meal_id=".$id;
		$podacitagova=$baza->selectDB($upitTagova);
		$tagovi=array();

		while($tag=mysqli_fetch_assoc($podacitagova)){
			array_push($tagovi, ["id" => $tag["id"], "title" => $tag["title"], "slug" => $tag["slug"]]);
		}
		return $tagovi;
	}    

	function dohvatiKategoriju($id){	
		$baza = new Baza;
        $baza->spojiDB();

		$upitKategorije="SELECT category.title FROM meal LEFT JOIN category ON meal.category_id=category.id WHERE meal.id=".$id;
		$podatak = $baza->selectDB($upitKategorije);
		$k=mysqli_fetch_assoc($podatak);
		return $k["title"];
	}
}