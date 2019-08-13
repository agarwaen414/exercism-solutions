<?php

// Bob is a lackadaisical teenager. In conversation, his responses are very limited.

// Bob answers 'Sure.' if you ask him a question.

// He answers 'Whoa, chill out!' if you yell at him.

// He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

// He says 'Fine. Be that way!' if you address him without actually saying anything.

// He answers 'Whatever.' to anything else.

// The commented tests at the bottom of the bob_test.php are Stretch Goals, they are optional. 
// They may be easier to solve if you are using the mb_string functions, which aren't installed by default with every version of 
// PHP.
class Bob {
    function respondTo($phrase)
    {
            $mask = " \t\n\r\0\x0B\u{00a0}\u{2002}";
            $trimmed = trim($phrase, $mask);

            // He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
            if (preg_match('/^(?=[^a-z]*\?$).*[A-Z]/', $trimmed)) {
                return "Calm down, I know what I'm doing!";
            }
            // Bob answers 'Sure.' if you ask him a question.
            elseif (preg_match('/\?$/', $trimmed)) {
                return 'Sure.';
            }
            // He answers 'Whoa, chill out!' if you yell at him.
            elseif (mb_strtoupper($trimmed, 'utf-8') == $trimmed && preg_match('/[A-Za-z]/', $trimmed)) {    
                return 'Whoa, chill out!';
            }
            // He says 'Fine. Be that way!' if you address him without actually saying anything.
            elseif (empty($trimmed)) {
                return 'Fine. Be that way!';
            }
            // He answers 'Whatever.' to anything else.
            else {
                return 'Whatever.';
            }
    }
}
