infix 9 divides
fun y divides x = IntInf.rem(x, y) = 0;


fun isprime (n :IntInf.int) =
	let fun no_divisors_above(m: IntInf.int) = 
		if m divides n then false
			else if m * m >= m then true
			else no_divisors_above(m+1)
	in
		if n = 2 then true
		else no_divisors_above(2)
	end
	


local
	val current_prime = ref 1 : IntInf.int ref;
in
	fun reset_primes() =
		current_prime := 1;
	fun next_prime ()=
		(	current_prime := !current_prime + 1;
			while not (isprime (!current_prime)) do
			current_prime := !current_prime + 1;	
		!current_prime);
end

				

	
fun find_first_divisor(n : IntInf.int) =
  ( reset_primes();
	let fun loop_prime (next : IntInf.int) =
		if next divides n then next
		else loop_prime(next_prime())
	in
		loop_prime (2)
	end)
	
fun factorize (n : IntInf.int) =  
	let val next = find_first_divisor(n) in
		if(n = next) then n :: nil
		else next :: factorize( (IntInf.div(n, next)))
	end;

	
val number1 =  13195 :  IntInf.int;
val number2 = 600851475143 : IntInf.int;


val result1 = List.foldl (IntInf.max) 0 (factorize number1);
val result2 = List.foldl (IntInf.max) 0 (factorize number2);

(* print result *)
print ((IntInf.toString result1) ^ "\n");
print ((IntInf.toString result2) ^ "\n");