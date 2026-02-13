function substrings(sequence::String, motif::String)
	return first.(findall(motif, sequence; overlap=true))
end

@testset "Sample & Test Datasets" begin
	sample_dataset = ("GATATATGCATATACTT", "ATAT")
	sample_output  = [2, 4, 10]
	
	file = open("datasets/rosalind_subs.txt", "r")
	test_dataset = read(file, String) |> split .|> string
	close(file)
	test_output = [5, 43, 80, 183, 190, 205, 231, 327, 416, 431, 464, 516, 543, 590, 597, 630, 653, 669, 676, 683, 759, 793, 800, 807, 834, 872, 887]

	@test substrings(sample_dataset...) == sample_output
	@test substrings(test_dataset...)   == test_output
end; nothing
