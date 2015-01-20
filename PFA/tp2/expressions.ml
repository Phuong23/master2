(*******************************************************)
(*                                                     *)
(*            Évaluateur d'expressions                 *)
(*                                                     *)
(*******************************************************)

(*

(******************      Début Partie 2     *****************)
type expr =
    Entier of int
  | Reel of float
  | Somme of expr * expr  (* a+b *)
  | Mult of expr * expr  (* a*b *)

(***************    Parser (+Genlex)     ************)

open Genlex
let lexer = make_lexer ["+";"*";"(";")"]

let rec stream_to_list s =
  match Stream.peek s with
      None -> []
    | Some a -> Stream.junk s;a::(stream_to_list s)

exception Syntax_error

(* TODO : utiliser camlp4 pour pouvoir utiliser directement "parser" sur les Stream ! *)

let parse liste = (* liste : token list *)
  let rec parse_expr = 
    function
      | (Int n)::r -> (Entier n),r
      | (Float x)::r -> (Reel x),r
      | (Kwd "(")::r -> parse_closing r (* parenthèse ouvrante : déléguer. *)
      | _ -> raise Syntax_error
  and parse_closing expr = (* expr dans des parenthèses. Rq : on peut en fermer trop.*)
    let (e,l) = parse_full expr in
      match l with
	  (Kwd ")")::r -> (e,r) 
	| _ -> raise Syntax_error
  and parse_full expr =  (* expr complète *)
    let (e1,l) = parse_expr expr in
      match l with
	  [] -> e1,l
	| (Kwd ")")::_ -> e1,l 
	    (* parenthèse fermante remontée à parse_closing. *)
	| (Kwd "+")::r -> let e2,rr = parse_full r in (Somme (e1,e2)),rr
	| (Kwd "*")::r -> let e2,rr = parse_full r in (Mult (e1,e2)),rr
	| _ -> raise Syntax_error
  in fst (parse_full liste)

let string_to_expr s = parse (stream_to_list (lexer (Stream.of_string s)))

(****************************************************************)
(*                                                              *)
(*                Remplir le TP à partir d'ici                  *)
(*                                                              *)
(****************************************************************)

(**************   Exemples partie 2   *******************)
let e1 = string_to_expr "2*3.6"
let e2 = string_to_expr "(2*3)+5"   (* parenthèses obligatoires *)
let e3 = string_to_expr "2*(3+5)"

(* 2.2 *)

let rec nb_add e =
  match e with
  | Somme (l, r) -> 1 + (nb_add l) + (nb_add r)
  | Mult (l, r)  -> 0 + (nb_add l) + (nb_add r)
  | _            -> 0
;;

let test = nb_add e1
let test = nb_add e2
let test = nb_add e3

let rec parcours e =
  match e with
  | Somme (l, r) | Mult (l, r)  -> (parcours l) + (parcours r)
  | Entier x     | Reel x       -> 1
;;

let test = parcours e1
let test = parcours e2
let test = parcours e3

(* 2.3 *)

let rec print_expr e =
  match e with
  | Somme (l, r) -> print_char '('; print_expr l; print_char '+'; print_expr r; print_char ')'
  | Mult  (l, r) -> print_char '('; print_expr l; print_char '*'; print_expr r; print_char ')'
  | Entier x     -> print_int x
  | Reel   x     -> print_float x
;;

let test = print_expr e1
let test = print_expr e2
let test = print_expr e3

let rec expr_to_string e =
  match e with
  | Somme (l, r) -> Printf.sprintf "(%s + %s)" (expr_to_string l) (expr_to_string r)
  | Mult  (l, r) -> Printf.sprintf "(%s * %s)" (expr_to_string l) (expr_to_string r)
  | Entier x     -> Printf.sprintf "%d" x
  | Reel   x     -> Printf.sprintf "%F" x
;;

let test = expr_to_string e1
let test = expr_to_string e2
let test = expr_to_string e3

let print_expr2 e = print_string (expr_to_string e)

let test = print_expr2 e1
let test = print_expr2 e2
let test = print_expr2 e3

let rec eval_expr e =
  match e with
  | Somme (l, r) -> (eval_expr l) +. (eval_expr r)
  | Mult  (l, r) -> (eval_expr l) *. (eval_expr r)
  | Entier x     -> float_of_int x
  | Reel   x     -> x
;;

let test = eval_expr e1
let test = eval_expr e2
let test = eval_expr e3

  *)

(*************    Fin Partie 2    ***********************)

(************     Début partie 3  ***********************)

(*    Commenter tout ce qui est au dessus et décommenter le code de la
      partie 3.
*)

type expr =
    Entier of int
  | Reel of float
  | Var of string
  | Somme of expr * expr  (* a+b *)
  | Mult of expr * expr  (* a*b *)
;;

(***************    Parser (+Genlex)     ************)

open Genlex
let lexer = make_lexer ["+";"*";"(";")"]

let rec stream_to_list s =
  match Stream.peek s with
      None -> []
    | Some a -> Stream.junk s;a::(stream_to_list s)
;;

exception Syntax_error

(* TODO : utiliser camlp4 pour pouvoir utiliser directement "parser" sur les Stream ! *)

let parse liste = (* liste : token list *)
  let rec parse_expr = 
    function
      | (Int n)::r -> (Entier n),r
      | (Float x)::r -> (Reel x),r
      | (Ident s)::r -> (Var s),r
      | (Kwd "(")::r -> parse_closing r (* parenthèse ouvrante : déléguer. *)
      | _ -> raise Syntax_error
  and parse_closing expr = (* expr dans des parenthèses. Rq : on peut en fermer trop.*)
    let (e,l) = parse_full expr in
      match l with
	  (Kwd ")")::r -> (e,r) 
	| _ -> raise Syntax_error
  and parse_full expr =  (* expr complète *)
    let (e1,l) = parse_expr expr in
      match l with
	  [] -> e1,l
	| (Kwd ")")::_ -> e1,l (* parenthèse fermante remontée à parse_closing. *)
	| (Kwd "+")::r -> let e2,rr = parse_full r in (Somme (e1,e2)),rr
	| (Kwd "*")::r -> let e2,rr = parse_full r in (Mult (e1,e2)),rr
	| _ -> raise Syntax_error
  in fst (parse_full liste)
;;

let string_to_expr s = parse (stream_to_list (lexer (Stream.of_string s)))

(****************************************************************)
(*                                                              *)
(*                Remplir le TP à partir d'ici                  *)
(*                                                              *)
(****************************************************************)

let rec vars e =
  match e with
  | Var v                      -> v::[]
  | Entier x                   -> []
  | Reel x                     -> []
  | Somme (l, r) | Mult (l, r) -> (vars l) @ (vars r) 
;;

let rec print_expr e=
  let rec expr_to_string e =
    match e with
    | Somme (l, r) -> Printf.sprintf "(%s + %s)" (expr_to_string l) (expr_to_string r)
    | Mult  (l, r) -> Printf.sprintf "(%s * %s)" (expr_to_string l) (expr_to_string r)
    | Entier x     -> Printf.sprintf "%d" x
    | Reel   x     -> Printf.sprintf "%F" x
    | Var    v     -> v
  in
  print_string (expr_to_string e)

let e0 = string_to_expr "5+1.2"
let e1 = string_to_expr "2*x"
let e2 = string_to_expr "(2*x)+y"   (* parenthèses obligatoires *)
let e3 = string_to_expr "2*(x+x)"

let test = print_expr e0
let test = print_expr e1
let test = print_expr e2
let test = print_expr e3

let test = vars e0
let test = vars e1
let test = vars e2
let test = vars e3



type env = (string * expr) list
(*  Question 8. Décommenter et compléter   *)
(*
let rec eval_expr (env:env) =
(* le "(env:env)" force le type à etre env et pas "string*int list". *)
*)

(**************   Exemples partie 3   *******************)
let e0 = string_to_expr "5+1.2"
let e1 = string_to_expr "2*x"
let e2 = string_to_expr "(2*x)+y"   (* parenthèses obligatoires *)
let e3 = string_to_expr "2*(x+x)"

(* Évaluation des exemples. Décommenter pour tester. *)
(*
let _ = eval_expr ["x",Entier 3] e1
let _ = eval_expr ["x",e0] e1
let _ = eval_expr ["x",e0 ; "y",Reel 5.3] e2
let _ = eval_expr ["x",Reel 2.98] e3
let _ = eval_expr ["y",Entier 0] e3  (* doit provoquer une erreur *)
*)

(*************    Fin Partie 3    ***********************)

(************     Début partie 4  ***********************)
(*
(*    Commenter tout ce qui est au dessus et décommenter le code de la
      partie 4.
*)


type expr =
    Entier of int
  | Reel of float
  | Var of string
  | Somme of expr * expr  (* a+b *)
  | Mult of expr * expr  (* a*b *)
  | Def of string * expr * expr (* Soit x = e1 dans e2 *)

(***************    Parser (+Genlex)     ************)

open Genlex
let lexer = make_lexer ["+";"*";"(";")";"soit";"Soit";"dans";"="]

let rec stream_to_list s =
  match Stream.peek s with
      None -> []
    | Some a -> Stream.junk s;a::(stream_to_list s)

exception Syntax_error

(* TODO : utiliser camlp4 pour pouvoir utiliser directement "parser" sur les Stream ! *)

let parse liste = (* liste : token list *)
  let rec parse_expr = 
    function
      | (Int n)::r -> (Entier n),r
      | (Float x)::r -> (Reel x),r
      | (Ident s)::r -> (Var s),r
      | (Kwd "(")::r -> parse_closing r 
	  (* parenthèse ouvrante : déléguer. *)
      | (Kwd "Soit")::r | (Kwd "soit")::r -> parse_let r
	  (* définition : déléguer. *)
      | _ -> raise Syntax_error
  and parse_closing expr = 
    (* expr dans des parenthèses. Rq : on peut en fermer trop.*)
    let (e,l) = parse_full expr in
      match l with
	  (Kwd ")")::r -> (e,r) 
	| _ -> raise Syntax_error
  and parse_let =
    function
	(Ident s)::(Kwd "=")::r ->
	  begin
	    let e1,ein = parse_expr r in
	      match ein with
		  (Kwd "dans")::rr ->
		    let e2,fin = parse_expr rr in Def(s,e1,e2),fin
		| _ -> raise Syntax_error
	  end
      | _ -> raise Syntax_error
  and parse_full expr =  (* expr complète *)
    let (e1,l) = parse_expr expr in
      match l with
	  [] -> e1,l
	| (Kwd ")")::_ -> e1,l (* parenthèse fermante remontée à parse_closing. *)
	| (Kwd "+")::r -> let e2,rr = parse_full r in (Somme (e1,e2)),rr
	| (Kwd "*")::r -> let e2,rr = parse_full r in (Mult (e1,e2)),rr
	| _ -> raise Syntax_error
  in fst (parse_full liste)

let string_to_expr s = parse (stream_to_list (lexer (Stream.of_string s)))

(****************************************************************)
(*                                                              *)
(*                Remplir le TP à partir d'ici                  *)
(*                                                              *)
(****************************************************************)



(**************   Exemples partie 4   *******************)
let e0 = string_to_expr "5+1.2"
let e1 = string_to_expr "Soit x=3 dans (2*x)" (* parenthèses obligatoires *)
let e2 = string_to_expr "Soit x = 1.3 dans soit y=42 dans ((2*x)+y)"
let e3 = string_to_expr "Soit x=1 dans (x+x)+4"
let e4 = string_to_expr "(Soit x=14 dans x)+(2*x)"
  (* erreur à l'évaluation car x est libre*)
  *)
(*************    Fin Partie 4    ***********************)

(************     Début partie 5  ***********************)

(*    Commenter tout ce qui est au dessus et décommenter le code de la
      partie 5.
*)

(*
(* Le code de la partie 5 sera presque entièrement repris dans le projet
   (évaluateur d'un mini-Caml) *)

type valeur =
    Entier of int
  | Reel of float
  | Booleen of bool
type expr = 
    Val of valeur
  | Var of string
  | Somme of expr * expr  (* a+b *)
  | Mult of expr * expr  (* a*b *)
  | Non of expr
  | Ou of expr * expr
  | Et of expr * expr
  | Egal of expr * expr (* e1=e2 ? *)
  | PlusGrand of expr * expr (* e1 > e2 ? *)     
  | Def of string * expr * expr (* Soit x = e1 dans e2 *)

(***************    Parser (+Genlex)     ************)

open Genlex
let lexer = make_lexer ["+";"*";"(";")";"soit";"Soit";"dans";"=";
		       "non";"ou";"et";">";"vrai";"faux"]

let rec stream_to_list s =
  match Stream.peek s with
      None -> []
    | Some a -> Stream.junk s;a::(stream_to_list s)

exception Syntax_error

(* TODO : utiliser camlp4 pour pouvoir utiliser directement "parser" sur les Stream ! *)

let parse liste = (* liste : token list *)
  let rec parse_expr = 
    function
      | (Int n)::r -> (Val (Entier n)),r
      | (Float x)::r -> (Val (Reel x)),r
      | (Kwd "vrai")::r -> (Val (Booleen true)),r
      | (Kwd "faux")::r -> (Val (Booleen false)),r
      | (Ident s)::r -> (Var s),r
      | (Kwd "non")::r ->
	  let e,fin = parse_expr r in (Non e),fin
      | (Kwd "(")::r -> parse_closing r 
	  (* parenthèse ouvrante : déléguer. *)
      | (Kwd "Soit")::r | (Kwd "soit")::r -> parse_let r
	  (* définition : déléguer. *)
      | _ -> raise Syntax_error
  and parse_closing expr = 
    (* expr dans des parenthèses. Rq : on peut en fermer trop.*)
    let (e,l) = parse_full expr in
      match l with
	  (Kwd ")")::r -> (e,r) 
	| _ -> raise Syntax_error
  and parse_let =
    function
	(Ident s)::(Kwd "=")::r ->
	  begin
	    let e1,ein = parse_expr r in
	      match ein with
		  (Kwd "dans")::rr ->
		    let e2,fin = parse_expr rr in Def(s,e1,e2),fin
		| _ -> raise Syntax_error
	  end
      | _ -> raise Syntax_error
  and parse_full expr =  (* expr complète *)
    let (e1,l) = parse_expr expr in
      match l with
	  [] -> e1,l
	| (Kwd ")")::_ -> e1,l (* parenthèse fermante remontée à parse_closing. *)
	| (Kwd "+")::r -> let e2,rr = parse_full r in (Somme (e1,e2)),rr
	| (Kwd "*")::r -> let e2,rr = parse_full r in (Mult (e1,e2)),rr
	| (Kwd "ou")::r -> let e2,rr = parse_full r in (Ou (e1,e2)),rr
	| (Kwd "et")::r -> let e2,rr = parse_full r in (Et (e1,e2)),rr
	| (Kwd "=")::r -> let e2,rr = parse_full r in (Egal (e1,e2)),rr
	| (Kwd ">")::r -> let e2,rr = parse_full r in (PlusGrand (e1,e2)),rr
	| _ -> raise Syntax_error
  in fst (parse_full liste)

let string_to_expr s = parse (stream_to_list (lexer (Stream.of_string s)))

(****************************************************************)
(*                                                              *)
(*                Remplir le TP à partir d'ici                  *)
(*                                                              *)
(****************************************************************)



(**************   Exemples partie 5   *******************)
let e0 = string_to_expr "5+1.2"
let e1 = string_to_expr "Soit x=3 dans (2*x)" (* parenthèses obligatoires *)
let e2 = string_to_expr "Soit x = 1.3 dans soit y=42 dans ((2*x)+y)"
let e3 = string_to_expr "Soit x=1 dans (x+x)+4"
let e4 = string_to_expr "(Soit x=14 dans x)+(2*x)"
  (* erreur à l'évaluation car x est libre*)


let e5 = string_to_expr "1=2"
let e6 = string_to_expr "Soit x=((2.4+3)>5) dans non (x ou faux)"

let e7 = string_to_expr "1=faux" 
  (* erreur de type donc erreur à l'évaluation car on nevérifie pas
     encore les types pour le moment *)
  *)
