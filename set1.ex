defmodule Set1 do
    def enc_b64(str_b16) do
        case Base.decode16(str_b16, case: :mixed) do
            {:ok, str_bin} -> Base.encode64(str_bin)
            :error -> :error
        end
    end
end
