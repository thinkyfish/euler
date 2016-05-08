fun div_3_or_5 x = Int.rem(x , 3) = 0 orelse Int.rem(x , 5) = 0;

val result = List.foldl (op +) 0 (List.filter div_3_or_5 (List.tabulate(1000, fn x => x)));

print ((Int.toString result) ^ "\n");

