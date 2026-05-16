; describing Family Tree in Atomspace
(Parent Chandler John)
(Parent Chandler Adam)
(Parent Chandler Jane)
(Parent Chandler Pam)
(Parent Monica John)
(Parent Monica Adam)
(Parent Monica Jane)
(Parent Monica Pam)
(Parent John Bob)
(Parent Pam Tim)
(Parent Pam Kim)
(Parent Ada Eve)
(Parent Jane Joey)
(Female Monica)
(Female Kim)
(Female Jane)
(Female Eve)
(Female Joey)
(Male Chandler)
(Male John)
(Male Adam)
(Male Bob)
(Male Tim)
(Male Pam)

    ; Practice queries
!(match &self (Parent $x John) $x)
    ;search for mother of Pam
!(match &self (Parent $x Pam)
(match &self (Female $x) $x))
    ; search for siblings of Pam
!(match &self (Parent $y Pam)
(match &self (Parent $y $sib) $sib))
    ; search for Uncles of Kim
!(match &self (Parent $y Kim)
(match &self (Parent $z $y)
(match &self (Parent $z $sib)
(match &self (Male $sib) $sib)
)))




