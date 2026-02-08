struct Fasta
	label::String
	sequence::String
end

function Fasta(s::String)::Vector{Fasta}
	split(s, ">")                              |> # split s on labels
		x -> x[2:end]                         .|> # skip "" since s starts with a label
		x -> split(x; limit=2)                .|> # split individual Fasta into label and sequence
		string                                 |> # convert substrings returned by split
		x -> [x[1], replace(x[2], "\n" => "")] |> # remove newlines in sequences
		x -> Fasta(x...)                          # return Vector{Fasta}
end
