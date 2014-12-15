Require Import Coq.Setoids.Setoid.
Require Import Coq.Arith.Even.
Require Import Coq.Arith.Div2.
Require Import Coq.Arith.Mult.
Require Export Coq.Classes.SetoidDec.

Lemma sur_2 : forall x:nat, {y:nat & {x = (2 * y)} + {x = (2 * y) + 1}}.
(* "+" signifie "ou" *)
(* On prend des valeurs X tel qu'il existe une valeur y tel que P(x, y) est vérifiée *)

intro x.
exists (div2 x).
Print div2.
Check even_S x.
Check div2 x. (*case x.*)
induction x.
change (div2 0) with 0.
rewrite mult_0_r.
change (0 + 1) with 1.
left.
reflexivity.
Print even_odd_dec.
Check {S x = 2 * div2 (S x)} + {S x = 2 * div2 (S x) + 1}.
Check 2 * div2 (S x).
Print S.
rewrite mult_succ_l.
rewrite mult_1_l.
Check div2 (S x) + div2 (S x).
replace (div2 (S x) + div2 (S x)) with (double (div2 (S x))).
(* apply double_even. *)
(* odd double *)


replace ((S x) = double (div2 (S x))) with (even (S x)).
replace ((S x) = double (div2 (S x)) + 1) with (odd (S x)).

apply even_odd_dec.