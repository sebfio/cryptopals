defmodule Set1 do
	@doc ~S"""
	B16 -> B64 function

	    iex>Set1.enc_b64("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
	    {:ok, "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"}
	"""
	def enc_b64(str_b16) do
        case Base.decode16(str_b16, case: :mixed) do
            {:ok, str_bin} -> {:ok , Base.encode64(str_bin)}
            :error -> :error
        end
    end
end
