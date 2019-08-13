<?php

// Write a function to convert from normal numbers to Roman Numerals

function toRoman($number)
{
    $numerals = array(1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I');
    $result = '';
    $last_key = 0;
    $last_value = '';

    foreach ($numerals as $key => $value) {
        $prepend = prepend($last_key);
        $subtract_value = $last_key - $prepend;

        // handle case where remaining number is one "unit" different
        if ($last_key > 0 && (int) ($number / $subtract_value) > 0) {
            $result .= $numerals[$prepend] . $last_value;
            $number = $number - $subtract_value;
        }
        elseif ((int) ($number / $key) > 0) {
            $multiplier = (int) ($number / $key);
            $result .= str_repeat($value, $multiplier);
            $number = $number - ($multiplier * $key);
        }

        $last_key = $key;
        $last_value = $value;
    }

    return $result;
}

function prepend($num)
{
    $check = $num;

    while ($check > 10) {
        $left = $check / 10;

        if ($left == 10) {
            return $num / 10;
        }
        elseif ($left < 10) {
            return 2 * ($num / 10);
        }
        $check = $left;
    }
}