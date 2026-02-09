function hamming_distance(s::String, t::String)
	@assert length(s) == length(t)
	hd = 0
	for (i, j) in zip(s, t)
		if (i != j) hd += 1; end
	end
	return hd
end

s = "GAGCCTACTAACGGGAT"
t = "CATCGTAATGACGGCCT"

hamming_distance(s, t)

@testset "Sample & Test Datasets" begin
	sample_s = "GAGCCTACTAACGGGAT"
	sample_t = "CATCGTAATGACGGCCT"

	file = open("datasets/rosalind_hamm.txt", "r")
	test_s, test_t = read(file, String) |> split .|> string
	close(file)
	test_s, test_t

	@test hamming_distance(sample_s, sample_t) == 7
	@test hamming_distance(test_s, test_t) == 457
end; nothing