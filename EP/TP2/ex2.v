Require Import ZArith.
Open Scope Z_scope.
Print positive.
Print Z.
(* donc on va faire une division binaire *)
(* Zpos convertit un positive en en Z *)
(* un positive est un entier naturel codé en binaire *)
Definition div4 (p:positive) :Z := match p with
| xO (xO n) => Zpos n (* "xO (xO xH)" = "100" *)
| xO (xI n) => Zpos n (* "xO (xI xH)" = "110" *)
| xI (xO n) => Zpos n (* "xI (xO xH)" = "101" *)
| xI (xI n) => Zpos n (* "xI (xI xH)" = "111" *)
| other => Z0
end.
Eval compute in div4 1%positive. (* on peut convertir en positive *)
Eval compute in div4 4.
Eval compute in div4 16.
Eval compute in div4 17.
Eval compute in div4 1098332434.