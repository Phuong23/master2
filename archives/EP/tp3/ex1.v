Require Import Rbase.
Open Scope R_scope.
Print Rmult_integral_contrapositive.

Ltac split_Rmult :=
  match goal with
  | |- ((?X1 * ?X2)%R <> 0%R) =>
         apply Rmult_integral_contrapositive; split; try split_Rmult
  end
.

Lemma test : forall x, x <> 0 -> 3 * x * 2 <> 0.

intros.
split_Rmult; discrR. (* discrR résout automatiquement 2 <> 0 *)
assumption.
Qed.