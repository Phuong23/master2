Lemma double:
  forall n:nat, {m | m = (plus n n)}.

intro.
exists (plus n n).
reflexivity.
Qed.

Extraction "ex3.ml" double.