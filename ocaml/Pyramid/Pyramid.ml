(*
* @file Pyramid.ml
* @brief Print a pyramid with parameters
* @author Loic GUEGAN
* @version 0.1
*)

(* ----- Options ----- *)
let bloc='#';;
let space=' ';;
let height=9;;
let reversed=false;;
(* ------------------- *)

(*
* @fun int => int
* @brief Calculate the number of bloc in a given level
*
* @param The level you want the number of bloc
* @return The number of bloc in this level
*)
let getNumberOfBlocInLvl level=
	level + (level - 1);
;;

(*
* @fun int => int => int
* @brief Calculate the number of space in a given level
*
* @param The level you want the number of space and the pyramid height
* @return The number of space in this level
*)
let getNumberOfSpaceInLvlOfHeight level height=
	(getNumberOfBlocInLvl height) - (getNumberOfBlocInLvl level);
;;

(*
* @fun int => int => int
* @brief Calculate the number of space before the first bloc in a given level
*	 of a pyramid of an height
*
* @param The level you want the number of space before the first bloc and the pyramid height
* @return The number of space before the first bloc in this level
*)
let getNumberOfSpaceBeforeTheFirstBlocInLvlOfHeight level height=
	((getNumberOfSpaceInLvlOfHeight level height) / 2);
;;
	


(*
* @fun int => String
* @brief Build a string with a given number of space using global variable 'space'
*
* @param The number of space
* @return The string with the given number of space
*)
let rec buildSpaceOfAFloor nbSpace=
  match (nbSpace) with
    | 0 -> ""
    | 1 -> (Char.escaped space)
    | n -> (Char.escaped space) ^ (buildSpaceOfAFloor (n-1));
;; 

(*
* @fun int => String
* @brief Build a string with a given number of bloc using global variable 'bloc'
*
* @param The number of bloc
* @return The string with the given number of bloc
*)
let rec buildBlocOfAFloor nbBloc=
  match (nbBloc) with
    | 0 -> ""
    | 1 -> (Char.escaped bloc)
    | n -> (Char.escaped bloc) ^ (buildBlocOfAFloor (n-1));
;;


(*
* @fun int => int => String
* @brief Build a entire level in a string
*
* @param The number of space and the number of bloc
* @return The string with the level with a NEWLINE symbole at the end
*)
let buildAFloor nbSpace nbBloc=
  (buildSpaceOfAFloor nbSpace) ^ (buildBlocOfAFloor nbBloc) ^ "\n";
;;


(*
* @fun void => void
* @brief Build and print the pyramid
*
* @param No parameters
* @return No return
*)
let showThePyramid ()=
  for level=1 to height do
    print_string (buildAFloor (getNumberOfSpaceBeforeTheFirstBlocInLvlOfHeight level height) (getNumberOfBlocInLvl level));
  done
;;

(*
* @fun void => void
* @brief Build and print the reversed pyramid
*
* @param No parameters
* @return No return
*)
let showTheReversedPyramid ()=
  for level=height downto 1 do
    print_string (buildAFloor (getNumberOfSpaceBeforeTheFirstBlocInLvlOfHeight level height) (getNumberOfBlocInLvl level));
  done
;;

(*
* @fun void => void
* @brief Build and print the pyramid using global variable
*
* @param No parameters
* @return No return
*)
let main ()=
  if reversed then showTheReversedPyramid ()
	      else showThePyramid ()
;;
  

(* Calling the main function *)
main ();;