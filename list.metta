
; define length of the list

(= (mylength Nil) 0)

(= (mylength (:: $x $xs))
(+ 1 (mylength $xs)))

    ; check if the length is working well
!(mylength Nil)
!(mylength (:: 4 (:: 5 (:: 6 Nil))))