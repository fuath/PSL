(* This Isabelle theory is produced using the TIP tool offered at the following website: 
     https://github.com/tip-org/tools 
   This file was originally provided as part of TIP benchmark at the following website:
     https://github.com/tip-org/benchmarks 
   Yutaka Nagashima at CIIRC, CTU changed the TIP output theory file slightly 
   to make it compatible with Isabelle2017.*)
  theory TIP_rotate_snoc_self
imports "../../Test_Base"
begin

datatype 'a list = nil2 | cons2 "'a" "'a list"

datatype Nat = Z | S "Nat"

fun x :: "'a list => 'a list => 'a list" where
"x (nil2) z = z"
| "x (cons2 z2 xs) z = cons2 z2 (x xs z)"

fun snoc :: "'a => 'a list => 'a list" where
"snoc y (nil2) = cons2 y (nil2)"
| "snoc y (cons2 z2 ys) = cons2 z2 (snoc y ys)"

fun rotate :: "Nat => 'a list => 'a list" where
"rotate (Z) z = z"
| "rotate (S z2) (nil2) = nil2"
| "rotate (S z2) (cons2 z22 xs1) = rotate z2 (snoc z22 xs1)"

theorem property0 :
  "((rotate n (x xs xs)) = (x (rotate n xs) (rotate n xs)))"
  oops

end
