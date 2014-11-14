Require Export Reals.
Require Export Classical.
Open Local Scope R_scope.

Parameter rac2:R.

Definition is_irrat (x:R) : Prop :=
    forall n p :nat, x * (INR p) <> (INR n).

Definition is_rat (x:R) : Prop :=
    exists n:nat, exists p:nat, x * (INR p) = (INR n).
(* on doit parser p en réel grâce à INR *)
(* Le parsage se fait en récursif mais le résultat est bien un seul réel *)

Hypothesis two_rac2 : rac2 * rac2  = 2.
Hypothesis rac2_irr : is_irrat rac2.
Hypothesis two_rat : is_rat (Rpower rac2 2).
Hypothesis irrat_not_rat :
    forall x:R, ~(is_rat x) -> is_irrat x.

(* ~ signifie "non" *)

Lemma ex1 :
    exists x:R, exists y:R, is_irrat x /\ is_irrat y /\ is_rat (Rpower x y).

(* /\ signifie "et" *)

elim (classic (is_rat (Rpower rac2 rac2))).

(* cote gauche *)

intro.
exists rac2. (* pour x *)
exists rac2. (* pour y *)
split.           (* on ne peut appliquer que des hypothèses *)
apply rac2_irr.  (* ici rac2_irr est égal à "is_irrat rac2" *)
split.
apply rac2_irr.
assumption.

(* cote droit *)

intro.
exists (Rpower rac2 rac2). (* rac2 est un réel *)
exists rac2.
split.          
apply irrat_not_rat.
assumption.
split.
apply rac2_irr.
rewrite Rpower_mult.
rewrite two_rac2.
apply two_rat.
