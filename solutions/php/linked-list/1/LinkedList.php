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

class LinkedListNode
{
    public function __construct(public int $val, public ?LinkedListNode $next = null, public ?LinkedListNode $previous = null){}
}

class LinkedList
{
    private ?LinkedListNode $front = null;
    private ?LinkedListNode $back = null;

    public function shift(): int
    {
        $node = $this->front;
        $this->front = $this->front->next;
        if($this->front === null) {
            $this->back = null;
        } else {
            $this->front->previous = null;
        }
        return $node->val;
    }

    public function unshift(int $val)
    {
        $node = new LinkedListNode($val, $this->front);
        $this->front = $node;
        if($this->back === null) {
            $this->back = $this->front;
        } else {
            $this->front->next->previous = $this->front;
        }
    }

    public function pop(): int
    {
        $node = $this->back;
        $this->back = $this->back->previous;
        if($this->back === null) {
            $this->front = null;
        } else {
            $this->back->next = null;
        }
        return $node->val;
    }

    public function push(int $val)
    {
        $node = new LinkedListNode($val, null, $this->back);
        $this->back = $node;
        if($this->front === null) {
            $this->front = $this->back;
        } else {
            $this->back->previous->next = $this->back;
        }
    }
}
