<?php

// Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit])

// The algorithm consists of repeating the following over and over:

// take the next available unmarked number in your list (it is prime)
// mark all the multiples of that number (they are not prime)

function sieve($limit)
{
    if ($limit < 2) {
        return array();
    }

    $range = range(2, $limit);
    $primes = $range;

    // take the next available unmarked number in your list (it is prime)
    $idx = 0;

    while ($idx < count($primes)) {
        $matches = non_prime($primes, $idx);
        $primes = array_values(array_diff($primes, $matches));
        $idx++;
    }

    return $primes;
}

function non_prime($array, $idx)
{
    $result = array();
    // mark all the multiples of that number (they are not prime)
    foreach ($array as $key => $value) {
        if ($value % $array[$idx] === 0 && $value !== $array[$idx]) {
            $result[] = $value;
        }
    }
    
    return $result;
}