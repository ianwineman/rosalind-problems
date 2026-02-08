using Test
include("utils/main.jl")

function gc_content(sequence::String)
	(count("G", sequence) + count("C", sequence)) / length(sequence)
end

@testset "Sample & Test Datasets" begin
	sample_dataset = """>Rosalind_6404
CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC
TCCCACTAATAATTCTGAGG
>Rosalind_5959
CCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT
ATATCCATTTGTCAGCAGACACGC
>Rosalind_0808
CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC
TGGGAACCTGCGGGCAGTAGGTGGAAT"""

	sample_fastas = Fasta(test)
	sample_gcs = sample_fastas |> f -> map(f -> gc_content(f.sequence), f)
	sample_ans_label = sample_fastas[argmax(sample_gcs)].label
	sample_ans_gc = maximum(sample_gcs) * 100

	file = open("datasets/rosalind_gc.txt", "r")
	test_dataset = read(file, String)
	close(file)

	test_fastas = Fasta(test_dataset)
	test_gcs = test_fastas |> f -> map(f -> gc_content(f.sequence), f)
	test_ans_label = test_fastas[argmax(test_gcs)].label
	test_ans_gc = maximum(test_gcs) * 100

	#@info "$test_ans_label $test_ans_gc"
	@test sample_ans_label == "Rosalind_0808" && sample_ans_gc ≈ 60.919540
	@test test_ans_label == "Rosalind_8615" && test_ans_gc ≈ 51.83982683982684
end; nothing
