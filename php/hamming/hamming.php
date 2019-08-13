<?php

// It is found by comparing two DNA strands and counting how many of the nucleotides are different from their equivalent in the 
// other string

function distance($a, $b)
{
    if (strlen($a) !== strlen($b)) {
        throw new InvalidArgumentException('DNA strands must be of equal length.');
    }
    $a_array = str_split($a);
    $b_array = str_split($b);
    return count(array_diff_assoc($a_array, $b_array));
}
