;let us define a  binery Tree Data structure in Atom space
; define empty tree
; define anode with value,left and right subtrees
; define a custom Type for the tree

; define a Type
(: BST Type)
(: Empty BST)
(: Node (-> Number BST BST BST))

    ; 1.define a function to insert a value into the BST
    ; if the tree is empty, create a new node with the value
(= (insert $x Empty)
(Node $x Empty Empty))
    ; if the tree is not empty, compare the value with the current node value
(= (insert $x (Node $y $left $right))
(if (< $x $y)
(Node $y (insert $x $left) $right)
(if (> $x $y)
(Node $y $left (insert $x $right))
(Node $y $left $right))))

    ; check to see the result of inserting values into the BST
;!(insert 5 Empty)
;!(insert 3 (insert 5 Empty))

    ; 2.define a function to search for the value in the BST
    ; if the return is Empty  then the value is not found
(= (search $x Empty) false)

    ; if the tree is not empty, check if the value is equal to the current node value
(= (search $x (Node $y $left $right))
(if (== $x $y) true
(if (< $x $y)
    ; serach in the left subtree
(search $x $left)
    ; serach in the right subtree
(search $x $right))))


    ; check to see the result of seaching for the value in the BST
;!(search 5 (insert 7 Empty))
    ;3.define a function to find the minimum value in the BST
    ; check there is left value if there is no left value then he current node value is the minimum value
(= (find-min (Node $y Empty $right)) $y)
    ; if there is left value then find the minimum value in the left subtree recursively
(= (find-min (Node $y $left $right)) (find-min $left))
  
    ; check to see the result of finding the minimum value in the BST
;!(find-min (insert 5 (insert 3 (insert 7 Empty))))
    ;4. delete a value from the BST
    ; if the tree is empty, return empty
(= (bst-delete $x Empty)
Empty)

;  if the value to be deleted is equal to the current node value and the node has no children return empty
(= (bst-delete $x (Node $x Empty Empty))
Empty)

; if the value to be deleted is equal to the current node value and the node has only left child return the left child

(= (bst-delete $x
    (Node $x
    (Node $lv $ll $lr)
    Empty))

(Node $lv $ll $lr))


    ; if the value to be deleted is equal to the current node value and the node has only left child return the left child

    (= (bst-delete $x
        (Node $x
            Empty
        (Node $rv $rl $rr)))

        (Node $rv $rl $rr))

            ; if the value to be deleted is equal to the current node value and the node has two chidren
            (= (bst-delete $x
                (Node $x
                (Node $lv $ll $lr)
                (Node $rv $rl $rr)))

                (Node (find-min (Node $rv $rl $rr))

                (Node $lv $ll $lr)

                    (bst-delete
                    (find-min (Node $rv $rl $rr))
                    (Node $rv $rl $rr))))

                        ; if the value to be deleted is not equal to the current node value.
                    (= (bst-delete $x (Node $y $left $right))

                    (if (< $x $y)

                        (Node $y
                        (bst-delete $x $left)
                        $right)

                    (if (> $x $y)

                        (Node $y
                            $left
                        (bst-delete $x $right))

                        Empty)))
                        ; check to see the result of deleting  avalue from the BST
                    !(bst-delete 5 (Node 5 Empty Empty))
                    !(bst-delete 5 (Node 5 (Node 3 Empty Empty) Empty))
        
