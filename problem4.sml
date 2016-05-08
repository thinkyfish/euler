fun log_message (x, y) = (print ((Int.toString(x * y)) ^ " " ^ (Int.toString(x)) ^ " " ^ (Int.toString(y)) ^ "\n"));

val reverse_string = implode o rev o explode;

fun is_palindrome (x, y) = 
	let val product = Int.toString (x * y) in
		if(product = (reverse_string product)) then true
		else false
	end

fun sort(x, y) = if x > y then (x, y) else (y, x);

fun largest_product((x, y), (x', y')) = 
	if (x * y) > (x' * y') then (x , y)
	else (x' , y');

fun max_op_product(NONE, SOME(x,y)) = SOME(x,y)
  | max_op_product(SOME(x, y), NONE) = SOME(x, y)
  | max_op_product(NONE, NONE) = NONE
  | max_op_product(SOME(x, y), SOME(x', y')) = SOME (largest_product((x,y), (x', y')))


local
val min_search = 100
	val max_memory = 1000
	val memory = Array2.array(max_memory, max_memory, SOME(0, 0))

in
	fun Dyn_base (NONE) : (int * int) option = NONE
	  | Dyn_base (SOME (x,y)) = if (x > min_search) andalso (y > min_search) then    			
	 			if (is_palindrome(x,y)) then 								 
	 				 SOME(x, y)
	 			else  
	 		 		(max_op_product (Dyn (SOME(x - 1, y)), Dyn(SOME(x, y - 1))))
	  		else NONE

  and
  	  	 Dyn (NONE) : (int * int) option = NONE : (int * int) option
  	  	  | Dyn (SOME(x, y)) = 
  	  	  		let val (sx, sy) = (sort(x, y)) in
  	  	  			case Array2.sub(memory, sx, sy) of
  	  	  				SOME (0, 0) => let val r = (Dyn_base(SOME(sx, sy))) in
  	  	  								  (Array2.update(memory, sx, sy, r);
  	  	  								  r)
  	  	  						  end
  	  	  			  | SOME (x, y) => SOME(x, y)
  	  	  			  | NONE => NONE
  	  	  		end

  end;

val result = Dyn(SOME(999,999));

log_message(Option.valOf result);


