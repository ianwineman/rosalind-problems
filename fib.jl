using Test

"""
`n` number of months\n
`k` number of new pairs per litter\n
`pop` 0 for baby, 1 for adult
"""
function rabbit_recurrence(nk::Tuple{Int64, Int64}; pop=[0])
	n, k = nk
	if (n == 0) return pop; end
	adults = count(==(0), pop) + count(==(1), pop)
	babies = count(==(1), pop) * k
	n -= 1
	return rabbit_recurrence((n,k); pop=vcat(zeros(Int, babies), ones(Int, adults)))
end

@testset "Sample & Test Datasets" begin
	sample_dataset = (5, 3)
	test_dataset   = (30, 2)

	@test sample_dataset |> rabbit_recurrence |> sum == 19
	@test test_dataset   |> rabbit_recurrence |> sum == 357_913_941
end; nothing
