let import file_name separator =
  let child_list = ref [] in
  try
    let ic = open_in file_name in
    try
      while true do
        (* Create a list of values from a line *)
        let line_list = String.split_on_char separator (input_line ic) in
        let id = int_of_string (String.trim (List.nth line_list 0)) in
        let name = String.trim (List.nth line_list 1) in
        let parent = int_of_string( String.trim (List.nth line_list 2)) in
        child_list :=  (id,name,parent) ::  !child_list;
      done; !child_list
    with 
      | End_of_file -> close_in ic; !child_list
    with
      | e -> (Printf.printf "Bad import\n"; raise e)
