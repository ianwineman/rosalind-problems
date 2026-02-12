function protein_mass(protein::String)
	monoisotopic_masses = Dict(
		"A" => 71.03711,
		"C" => 103.00919,
		"D" => 115.02694,
		"E" => 129.04259,
		"F" => 147.06841,
		"G" => 57.02146,
		"H" => 137.05891,
		"I" => 113.08406,
		"K" => 128.09496,
		"L" => 113.08406,
		"M" => 131.04049,
		"N" => 114.04293,
		"P" => 97.05276,
		"Q" => 128.05858,
		"R" => 156.10111,
		"S" => 87.03203,
		"T" => 101.04768,
		"V" =>  99.06841,
		"W" => 186.07931,
		"Y" => 163.06333
	)
	return sum([monoisotopic_masses[string(aa)] for aa in protein])
end

@testset "Sample & Test Datasets" begin
	sample_dataset = "SKADYEK"
	sample_output  = 821.392
	
	file = open("datasets/rosalind_prtm.txt", "r")
	test_dataset = read(file, String) |> strip |> string
	close(file)
	test_output = 114283.831

	@test isapprox(sample_dataset |> protein_mass, sample_output; atol=0.001)
	@test isapprox(test_dataset   |> protein_mass, test_output;   atol=0.001)
end; nothing
