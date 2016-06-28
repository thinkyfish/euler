fun even a = Int.rem (a, 2) = 0;

local
	val max_memory = 100
	val memory = Array.array (max_memory, NONE)
in
	fun fib_base 0 = 1
	  | fib_base 1 = 1
	  | fib_base n = (fib (n-1)) + (fib (n-2))
  	and fib n =
  		if n < max_memory then
  			case Array.sub (memory, n) of
  				SOME r => r
  			  | NONE =>
  			    let val r = fib_base n in
  			        Array.update(memory, n, SOME r);
  			        r
  			    end
  	    else
  	    	fib_base n
end

fun fibs_starting_at n =
	let val f = (fib n) in
		if f < 4000000
		then f :: fibs_starting_at (n + 1) 
		else nil
	end;


val result = List.foldl (op +) 0 (List.filter even (fibs_starting_at 1));

print ((Int.toString result) ^ "\n");

