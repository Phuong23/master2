Require Import Coq.Setoids.Setoid.
Require Import Coq.Arith.Even.
Require Import Coq.Arith.Div2.

Lemma sur_2 : forall x:nat, {y:nat & {x = (2 * y)} + {x = (2 * y) + 1}}.
(* "+" signifie "ou" *)
(* On prend des valeurs X tel qu'il existe une valeur y tel que P(x, y) est vérifiée *)

intro x.
exists (div2 x).

reflexivity.

(* inversion x. *)

rewrite even_odd_dec.