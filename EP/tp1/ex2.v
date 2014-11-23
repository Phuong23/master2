Fixpoint pow_nat (n m : nat) { struct m } : nat :=
(* n ET m de type nat *)
(* m décroît et permet l'arrêt de la récursivité *)
(* pow_nat est de type nat *)
    match m with
    | 0 => S 0 (* si c'est 0 on donne 1, comme en maths *)
    | S p => n * (pow_nat n p) (* s est la fonction successeur *)
         (* ex : "2 x (pow nat 2 3)" 
                  à la fin ça fait 2 x 2 x 2 x 2 x 1 = 2 puissance 4 *)
end.

Eval compute in (pow_nat 2 3).