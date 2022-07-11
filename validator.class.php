<?php
class Validator{
    

    function validString($text){
        if(strpos($text, "<") !==false || strpos($text, ">") !==false || strpos($text, "'") !==false || strpos($text, '"') !==false){
            throw new Exception("Ne smiju se sadržavati znakovi <, >, ', "."'"."!");
        }
        else{
            return true;
        }
    }
    
    function validateDate($date, $format = 'Y-m-d')
    {
        $d = DateTime::createFromFormat($format, $date);
        if(!($d && $d->format($format) === $date)){
            throw new Exception("Krivi format datuma!");
        }
    }
    
    function jeBroj($broj){
        if(ctype_digit($broj)){
            return true;
        }
        else{
            throw new Exception($broj." mora biti broj!");
        }
    }
    
    function isNegative($broj){
        if($broj<0){
            throw new Exception($broj." mora biti pozitivan!");
        }
        else{
            return false;
        }
    }
}

?>