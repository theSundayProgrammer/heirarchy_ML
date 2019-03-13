let lower_bound cmp arr x =
   let rec aux lo hi =
     if lo = hi then lo
     else let mid = lo + (hi-lo)/2 in
     if cmp arr.(mid)  x < 0
       then aux  (mid + 1) hi
       else aux lo (mid)
  in aux 0 (Array.length arr) 

let upper_bound cmp arr x =
   let rec aux lo hi =
     if lo = hi then lo
     else let mid = lo + (hi-lo)/2 in
     if cmp arr.(mid)  x > 0
       then aux lo mid
       else aux  (mid + 1) hi
  in aux 0 (Array.length arr) 
