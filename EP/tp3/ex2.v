Require Import Rbase.
Require Import Reals.
Open Scope R_scope.

Lemma yop : forall x, (0 < x) -> (0 < 3 * x * 2).

Proof.

intros.

Ltac split_pos_Rmult :=
  match goal with
  | |- (0%R < (?X1 * ?X2)%R) =>
         apply Rmult_lt_0_compat; 
         try split_pos_Rmult
  end
.
 
split_pos_Rmult; [prove_sup0 | assumption | prove_sup0].

Qed.
