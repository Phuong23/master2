Require Import ZArith.
Open Scope Z_scope. (* pour utiliser les relatifs *)
Print Zabs.

Record point:Set := point2 {
x:Z ; y:Z}.
Definition manhat (a:point) (b:point) :Z := match (a, b) with
| ((point2 x1 y1), (point2 x2 y2)) => (Zabs (x1 - x2)) + (Zabs (y1 - y2))
end.
Eval compute in manhat (point2 0 0) (point2 1 1).