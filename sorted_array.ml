(* convert a linear array of parent-child relationships to a tree *)

let print_item c tabs =
        let (id,name,parent) = c in
        (for i = 0 to tabs do Printf.printf " " done;
        Printf.printf "%d,  %s, %d \n" id name parent 
        )

let compare_parent x y =
  let (_,_,parent ) = x in
  let (id, _, _) = y in
     compare parent id

let rec print_tree arr root  tabs=
    print_item root tabs;
    let first_child = Bounds.lower_bound compare_parent arr root in
    let last_child = Bounds.upper_bound compare_parent arr root in
    for k = first_child to (last_child-1) do
       print_tree arr arr.(k) (tabs +1)
    done


let compare_child x y =
  let (_,_,p ) = x in
  let (_, _, q) = y in
     compare p q


let () =
  let arr = Mycsv.import Sys.argv.(1) "," |> Array.of_list  in 
  Array.sort compare_child arr;
  let root = Bounds.lower_bound compare_child arr (0,"",0) in 
  print_tree arr arr.(root) 0

  
