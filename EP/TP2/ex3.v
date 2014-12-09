Require Import Reals.
Open Scope R_scope.
Print Rpower.
Print Rmult_plus_distr_r.

Theorem puiree :
  forall r, forall x, forall y,
    (Rpower r (x + y)) = (Rpower r x) * (Rpower r y).

Proof.

intros.

Print Rpower.
unfold Rpower. (* unfold parce que Rpower est DANS le terme *)

Print Rmult_plus_distr_r.
rewrite Rmult_plus_distr_r. (* rewrite parce que "exp" gêne *)

Print exp_plus.
apply exp_plus. (* apply parce que c'est tout bon *)

Qed.