Require Export Omega.
Definition to_be_pape := 2 = 1.
Lemma i_am_the_pape : 2 + 2 = 5 ->to_be_pape.
Proof.
	replace (2 + 2) with 4; auto; intro.
	cut (1=2);[unfold to_be_pape; auto|omega].
Qed.


