Require Import Coq.Setoids.Setoid.
Lemma sur_2 : forall x:nat, {y:nat & {x = (2 * y)} + {x = (2 * y) + 1}}.
(* "+" signifie "ou" *)
(* On prend des valeurs X tel qu'il existe une valeur y tel que P(x, y) est vérifiée *)

Require Import Coq.Arith.Div2.
intro x.
exists (2).