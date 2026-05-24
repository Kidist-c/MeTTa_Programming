
; define length of the list

(= (mylength Nil) 0)

(= (mylength (:: $x $xs))
(+ 1 (mylength $xs)))

    ; check if the length is working well
!(mylength Nil)
!(mylength (:: 4 (:: 5 (:: 6 Nil))))

    ; check if the  an item is in the list

(= (is_member $x Nil) false)

(= (is_member $x (:: $x $xs)) true)

(= (is_member $x (:: $y $ys)) (is_member $x $ys))
    ; check if the is_member is working well
!(is_member 4 Nil)
!(is_member 4 (:: 4 (:: 5 (:: 6 Nil))))
!(is_member 7 (:: 4 (:: 5 (:: 6 Nil))))

    ; define the append function

(= (list_append Nil $ys) $ys)

(= (list_append (:: $x $xs) $ys) (:: $x (list_append $xs $ys)))
    ; check if the append is working well
!(list_append Nil 3)

    ; find the maximum element in the list
(= (max2 $x $y) (if (> $x $y) $x $y))

(= (maximum_list (:: $x Nil)) $x)

(= (maximum_list (:: $x $xs)) (max2 $x (maximum_list $xs)))
    ; check if the maximum_list is working well
!(maximum_list(:: 4 (:: 5 (:: 6 Nil))))

    ; find  the minimum element in the list
(= (min2 $x $y) (if (< $x $y) $x $y))

(= (minimum_list (:: $x Nil)) $x)

(= (minimum_list (:: $x $xs)) (min2 $x (minimum_list $xs)))
    ; check if the minimum_list is working well
!(minimum_list(:: 4 (:: 5 (:: 6 Nil))))
; push(insert an element at the head of the list)

(= (push_list $x $xs) (:: $x $xs))
    ; check if the push is woking well
!(push_list 4 Nil)
; pop(remove the head of the list)
(= (pop_list (:: $x $xs)) $xs)
    ; check if the pop is working well
!(pop_list (:: 4 (:: 5 (:: 6 Nil))))
    ; map a function to each element of the list
(= (map_list $f Nil) Nil)
(= (map_list $f (:: $x $xs)) (:: ($f $x) (map_list $f $xs)))
    ;check if the map_list is working well
(= (square $x)
(* $x $x))

!(map_list square (:: 1 (:: 2 (:: 3 Nil))))
    ; filter the list with a predicate function
(= (filter_list $pred Nil) Nil)

(= (filter_list $pred (:: $x $xs))
(if ($pred $x)
(:: $x (filter_list $pred $xs))
(filter_list $pred $xs)))

(= (positive $x)
(> $x 0))

    !(filter_list positive
    (:: 3 (:: -1 (:: 5 (:: -2 Nil)))))
