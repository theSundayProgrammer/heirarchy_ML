(* convert a linear array of parent-child relationships to a tree *)
let print_item c tabs =
        let (id,name,parent) = c in
        (for i = 0 to tabs do Printf.printf " " done;
        Printf.printf "id=%d  name=%s parent=%d \n" id name parent 
        )

let gen_map child children_map =
  let (_,_,parent) = child in
  Hashtbl.add children_map  parent child  


let rec prn_tree root children_map tabs =
  let (id,_,_) = root in
   (print_item root tabs;
   List.iter (fun y -> prn_tree y children_map (tabs + 1)) (Hashtbl.find_all children_map id))

let find_root children_map r = Hashtbl.find children_map r

let init () = Hashtbl.create 1000

let () =
let children_map = init () in 
(
Mycsv.import "heirarchy.dat" ',' |> List.iter (fun x -> gen_map x children_map) ;
let hd = find_root children_map 0 in
prn_tree hd children_map 1
)
