defmodule Program do

  def read([inst | _], 0) do inst end
  def read([_ | rest], pc) do
    read(rest, pc - 1)
  end

end
