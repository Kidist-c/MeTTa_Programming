
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