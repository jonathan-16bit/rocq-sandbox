(* Closure of natural numbers under addition *)

Module NatAdditionClosure.

(* Define natural numbers *)
(* O and S are constructors that kinda represent 0 and the successor respectively *)
Inductive nat : Type :=
| O : nat
| S : nat -> nat.

(* Define addition recursively *)
(* Fixpoint indicates this fn is recursive *)
(* The compiler type-checks to see if both branches result in a natural number *)
(* And it also checks if recursion is structurally decreasing *)
Fixpoint add (a b : nat) : nat :=
  match a with
  | O => b
  | S a' => S (add a' b)
  end.

(* Prove closure under addition *)
Theorem addition_closed :
  forall a b : nat,
    exists c : nat, add a b = c.
Proof.
  intros a b.

  (* From type checking the add fn, we know that (add a b) is a natural number *)
  exists (add a b). 

  reflexivity.
Qed.

End NatAdditionClosure.
