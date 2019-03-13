

let () =
let list = [1;2;2;3;4;3;5;6;7;6;7;8;8;6;7;9] in
let arr = Array.of_list list in
Array.sort compare arr;
Array.iter (fun x -> Printf.printf "%d " x) arr;
Printf.printf "\n";
Printf.printf "%d %d\n" (Bounds.lower_bound compare arr 6 )  (Bounds.upper_bound compare arr  6);
Printf.printf "%d %d\n" (Bounds.lower_bound compare arr 10) (Bounds.upper_bound  compare arr 10);
Printf.printf "%d %d\n" (Bounds.lower_bound compare arr 1 )  (Bounds.upper_bound compare arr  1);
Printf.printf "%d %d\n" (Bounds.lower_bound compare arr 2 )  (Bounds.upper_bound compare arr  2);
(* Results 
1 2 2 3 3 4 5 6 6 6 7 7 7 8 8 9 
7 10
16 16
0 1
1 3
*)