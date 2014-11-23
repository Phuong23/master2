Require Export Omega. 
Require Export Mult.
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

(*construire le but du preuve*)
Lemma pow_nat_mult: forall n m p:nat, (pow_nat n m) * (pow_nat n p) = (pow_nat n (m + p)).
(*attention au parenthese sinon 0 + P ne pas prouver*)

Proof.
	induction m;simpl. 
(* ajouter le cas de base 0 et Suc de 0*)
(* simpl regarde pourquoi n puiss 0 il le transforme en 1 tout seul
   et puis il dit aussi que 0 + p c'est p
   il va regarder les types inductifs correspondants.
   Dans pow_nat on lui a dit que n puiss 0 c'est 1 
   donc il essaie d'appliquer les réductions de pow_nat
   Si on a p + 0 il va pas le réduire parce que dans l'addition de pow_nat c'est
   0 + quelque chose qu'il réduit et pas quelque chose + zéro.
   Le simpl il ne fait que de la REDUCTION de type inductif.
*)
	auto. (* il comprend tout seul que P + 0 = P *)
        (* IHM = hypothèse de récurrence *)
	intro.
	rewrite <- IHm.
        apply mult_assoc_reverse.
        Qed.

