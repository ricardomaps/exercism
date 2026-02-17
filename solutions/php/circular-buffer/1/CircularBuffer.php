<?php

/*
 * By adding type hints and enabling strict type checking, code can become
 * easier to read, self-documenting and reduce the number of potential bugs.
 * By default, type declarations are non-strict, which means they will attempt
 * to change the original type to match the type specified by the
 * type-declaration.
 *
 * In other words, if you pass a string to a function requiring a float,
 * it will attempt to convert the string value to a float.
 *
 * To enable strict mode, a single declare directive must be placed at the top
 * of the file.
 * This means that the strictness of typing is configured on a per-file basis.
 * This directive not only affects the type declarations of parameters, but also
 * a function's return type.
 *
 * For more info review the Concept on strict type checking in the PHP track
 * <link>.
 *
 * To disable strict typing, comment out the directive below.
 */

declare(strict_types=1);

class CircularBuffer
{
    // You need to add more methods yourself!

    private int   $writePointer;
    private int   $readPointer;
    private array $buffer;
    private int   $size;

    public function __construct(int $size)
    {
        $this->size = $size;
        $this->buffer = array_fill(0, $size, '');
        $this->writePointer = 0;
        $this->readPointer = 0;
    }

    public function read(): string
    {
        if($this->readPointer >= $this->writePointer) {
            throw new BufferEmptyError();
        }
        $val = $this->buffer[$this->readPointer % $this->size];
        $this->readPointer++;
        return $val;
    }

    public function write($item): void
    {
        if($this->_overlapping() and $this->readPointer < $this->writePointer) {
            throw new BufferFullError();
        }
        $this->buffer[$this->writePointer % $this->size] = $item;
        $this->writePointer++;
    }

    public function clear()
    {
        $this->readPointer = 0;
        $this->writePointer = 0;
        $this->buffer = array_fill(0, $this->size, '');
    }

    public function forceWrite($item)
    {
        if($this->_overlapping()) {
           $this->readPointer++; 
        }
        $this->buffer[$this->writePointer % $this->size] = $item;
        $this->writePointer++;
    }

    private function _overlapping(): bool
    {
        return $this->writePointer % $this->size === $this->readPointer % $this->size;
    }
}

class BufferFullError extends Exception
{
}

class BufferEmptyError extends Exception
{
}
