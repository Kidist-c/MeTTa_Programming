;let us define a  binery Tree Data structure in Atom space
; define empty tree
; define anode with value,left and right subtrees
; define a custom Type for the tree

; define a Type
(: BST Type)
(: Empty BST)
(: Node (-> Number BST BST BST))

    ; define a function to insert a value into the BST
    ; if the tree is empty, create a new node with the value
(= (insert $x Empty) (Node $x Empty Empty))

    ; insert into non empty tree
(= (insert $x (Node $y $left $right))
    ; check if the value is less than the current node value
(if (< $x $y)
    ; insert into the left subtree
(Node $y (insert $x $left) $right)
    ; insert into the right subtree
(if (> $x $y)
(Node $y $left (insert $x $right))
    ; if the value is equal to the current node value, do nothing
(Node $y $left $right)
)
)
)

; check to see the result of inserting values into the BST
!(insert 5 Empty)
!(insert 3 (insert 5 Empty))

    ; define a function to search for the value in the BST
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
!(search 5 (insert 7 Empty))