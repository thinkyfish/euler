div_range_evenly(n::Int,range::Range{Int}) = sum(rem(n, range)) == 0

problem5(range::Range{Int}) =
begin
	i = range.stop # don't start at zero
	while !div_range_evenly(i,range)
		i += range.stop
	end
	i
end

println("Result: $(problem5(1:20))")


