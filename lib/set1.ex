defmodule Set1 do
	@doc ~S"""
	B16 -> B64 function

	    iex> Set1.enc_b64("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
	    {:ok, "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"}
	"""
	def enc_b64(str_b16) do
        case Base.decode16(str_b16, case: :mixed) do
            {:ok, str_bin} -> {:ok , Base.encode64(str_bin)}
            :error -> :error
        end
    end

    @doc ~S"""
	Fixed XOR function
	
	    iex> Set1.fixed_xor("1c0111001f010100061a024b53535009181c", "686974207468652062756c6c277320657965")
	    {:ok, "746865206B696420646F6E277420706C6179"}
    """
    def fixed_xor(feed, xor) do
        {feed_resp, feed_b16} = Base.decode16(feed, case: :mixed)
        {xor_resp, xor_b16}   = Base.decode16(xor, case: :mixed)
        
        if feed_resp == :ok and xor_resp == :ok do
            {:ok, Base.encode16(:crypto.exor(feed_b16, xor_b16))}
        else
            :error
        end
    end
end
