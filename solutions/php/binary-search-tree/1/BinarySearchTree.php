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

class BinarySearchTree
{
    public ?BinarySearchTree $left = null;
    public ?BinarySearchTree $right = null;
    public int $data;

    public function __construct(int $data)
    {
        $this->data = $data;
    }

    public function insert(int $data)
    {
        if($data <= $this->data) {
            if($this->left === null) {
                $this->left = new BinarySearchTree($data);
            } else {
                $this->left->insert($data);
            }
        } else {
            if($this->right === null) {
                $this->right = new BinarySearchTree($data);
            } else {
                $this->right->insert($data);
            }
            
        }
    }

    public function getSortedData(): array
    {
        return array_merge($this->left?->getSortedData() ?? [], [$this->data], $this->right?->getSortedData() ?? []);
    }
}
