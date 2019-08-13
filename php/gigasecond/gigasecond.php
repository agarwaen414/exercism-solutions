<?php

// Calculate the moment when someone has lived for 10^9 seconds.

// A gigasecond is 10^9 (1,000,000,000) seconds.

function from($date)
{
    $endDate = clone $date;
    $endDate->add(new DateInterval('PT1000000000S'));
    return $endDate;
}
