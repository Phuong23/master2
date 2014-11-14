Fixpoint pow_nat (n m : nat) { struct m } : nat :=
    match m with
    | 0 => S 0
    | S p => n * (pow_nat n p) (* s est la fonction successeur *)
end.
