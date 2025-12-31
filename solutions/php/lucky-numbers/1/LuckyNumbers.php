<?php

class LuckyNumbers
{
    private function digitsToInt(array $digits): int {
        $res = 0;
        foreach($digits as $digit) {
            $res *= 10;
            $res += $digit;
        }

        return $res;
    }
    public function sumUp(array $digitsOfNumber1, array $digitsOfNumber2): int
    {
        return $this->digitsToInt($digitsOfNumber1) + $this->digitsToInt($digitsOfNumber2);
    }

    public function isPalindrome(int $number): bool
    {
        return strval($number) === strrev(strval($number));
    }

    public function validate(string $input): string
    {
        if(strlen($input) === 0) {
            return 'Required field';
        }
        $val = intval($input);
        if($val <= 0) {
            return 'Must be a whole number larger than 0';
        }
        return '';
    }
}
