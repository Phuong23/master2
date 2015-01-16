Printf.printf "------" ;;

type 'a liste = Vide | Cons of 'a * 'a liste

let rec list_to_liste l =
  match l with
  | [] -> Vide
  | x::xs -> Cons (x, (list_to_liste xs))

let rec liste_to_list l =
  match l with
  | Vide -> []
  | Cons (x, xs) -> x::(liste_to_list xs)

let l1 = [1; 2; 3; 4] 
(*
let l1' = list_to_liste l1 
let l1'' = liste_to_list l1' 
*)

let l2 = Vide 
(*
let l2' = liste_to_list l2 
let l2'' = list_to_liste l2' 
*)

let l3 = ['c'] 
(*
let l3' = list_to_liste l3 
let l3'' = liste_to_list l3'
*)

let length l =
  let rec length l acc =
    match l with
    | Vide -> acc
    | Cons (_, xs) -> length xs (acc + 1)
  in
  length l 0

(*
let ll1 = length l1'
let ll2 = length l2 
let ll3 = length l3' 
*)

let hd l =
  match l with
  | Vide -> failwith "erreur"
  | Cons (x, _) -> x

(*
let hl1 = hd l1'
let hl2 = hd l2
let hl3 = hd l3'
*)

let tl l =
 match l with
 | Vide -> failwith "erreur"
 | Cons (_, xs) -> xs

(* 
let tl1 = tl l1'
let tl2 = tl l2 
let tl3 = tl l3'
*)

let rec nth l n =
 match l, n with
 | _, n when n < 0 -> failwith "n negatif"
 | Vide, _         -> failwith "liste trop courte"
 | Cons (x, xs), 0 -> x
 | Cons (_, xs), _ -> nth xs (n - 1)
;;

(* 
let nl11 = nth l1' (-1)
let nl12 = nth l1' 3 
let nl13 = nth l1' 10
let nl14 = nth l2 0
let nl15 = nth l2 1
*)

let rec append l1 l2 =
  match l1 with
  | Vide -> l2
  | Cons (x, xs) -> Cons (x, (append xs l2))
;;

let rec rev_append l1 l2 =
  match l1 with
  | Vide -> l2
  | Cons (x, xs) -> rev_append xs (Cons (x, l2))
;;

let rev l = rev_append l Vide

let ll = list_to_liste [ list_to_liste [1; 2]; list_to_liste [1; 2; 3]; list_to_liste [1] ]

let rec concat ll = 
  match ll with
  | Vide -> Vide
  | Cons (x, xs) -> append x (concat xs)
;;

let rec iter f l =
  match l with
  | Vide -> ()
  | Cons (x, xs) -> let () = f x in iter f xs
;;

let l = (Cons(1,Cons(2,Cons(3,Vide))))

let affiche_liste l p = iter p l

let test = affiche_liste l print_int

let rec map f l =
  match l with
  | Vide -> Vide
  | Cons (x, xs) -> Cons(f x, map f xs)

let test = map (fun x -> x + 1) l

let rev_map f l =
  let rec rev_map l lacc = 
    match l with
    | Vide -> lacc
    | Cons (x, xs) -> rev_map xs (Cons (f x, lacc))
  in rev_map l Vide

let test = rev_map (fun x -> x + 1) l

let rec for_all p l =
  match l with 
  | Vide -> true
  | Cons (x, xs) ->
      if p x
      then for_all p xs
      else false
;;

let test = for_all (fun x -> x > 1) l
let test = for_all (fun x -> x = x) l

let rec exists p l =
  match l with 
  | Vide -> false
  | Cons (x, xs) ->
      if p x
      then true
      else exists p xs
;;

let test = exists (fun x -> x > 1) l
let test = exists (fun x -> x = x) l

let rec filter p l1 =
  match l1 with
  | Vide -> Vide
  | Cons (x1, xs1) ->
      if p x1
      then Cons (x1, filter p xs1) 
      else filter p xs1
;;

let test = filter (fun x -> x = 1) l
let test = filter (fun x -> x > 1) l

let rec assoc a l =
  match l with
  | Cons ((xa, xb), xs) when xa = a -> xb
  | Cons (_, xs) -> assoc a xs
  | Vide -> failwith "Not Found" 
;;

let lab = (list_to_liste [('a', 0); ('b', 1); ('c', 2)])
let test = assoc 'a' lab
let test = assoc 'b' lab
(* let test = assoc 'd' lab *)

let rec split l =
  match l with
  | Cons ((xa, xb), xs) -> 
      let (xsa, xsb) = split xs in
      (Cons (xa, xsa), Cons (xb, xsb)) 
  | Vide -> (Vide, Vide) 
;;

let test = split lab

let rec combine la lb =
  match (la, lb) with
  | Cons (xa, xsa), Cons (xb, xsb) -> Cons ((xa, xb), combine xsa xsb)
  | Vide, Vide -> Vide
  | _ -> failwith "Invalid Argument" (* Different lengths *)
;;

let test = let la, lb = split lab in combine la lb

