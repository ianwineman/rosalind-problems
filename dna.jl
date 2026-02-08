using Test

function nucleotide_counts(sequence::String)
	(
		count('A', sequence),
		count('C', sequence),
		count('G', sequence),
		count('T', sequence)
	)
end

@testset "Sample & Test Datasets" begin
	sample_dataset = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
	file = open("datasets/rosalind_dna.txt", "r")
	test_dataset = read(file, String)
	close(file)

	@test sample_dataset |> nucleotide_counts == (20, 12, 17, 21)
	@test test_dataset   |> nucleotide_counts == (229, 205, 185, 206)
end; nothing
