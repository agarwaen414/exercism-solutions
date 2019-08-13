<?php

// Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
// Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the 
// word.

function translate($phrase)
{
    //break up words
    $words = explode(' ', $phrase);

    // consonant sounds
    $cons = array(
        // possible combinations excluding those which cannot start a word
        'pt', 'gl', 'gr', 'ch', 'ph', 'ps', 'sh', 'st', 'th', 'wh', 'qu'
    );

    $three_letter_cons = array('squ', 'thr', 'sch');

    // Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.

    // Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of 
    // the word.
    foreach ($words as $key => $word) {
        if (ctype_alpha($word) && preg_match('/^[aeiou]|yt|xr/i', $word)) {
            $words[$key] = $word . 'ay';
        }
        elseif (in_array(substr($word, 0, 3), $three_letter_cons)) {
            $words[$key] = substr($word, 3) . substr($word, 0, 3) . 'ay';
        }
        elseif (in_array(substr($word, 0, 2), $cons)) {
            $words[$key] = substr($word, 2) . substr($word, 0, 2) . 'ay';
        }
        else {
            $words[$key] = substr($word, 1) . $word{0} . 'ay';
        }
    }  
    
    return implode(' ', $words);
}
