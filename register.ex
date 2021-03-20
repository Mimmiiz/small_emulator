defmodule Register do

  # create new register
  def create() do
    {0, 0, 0, 0, 0}
  end

  # write to register
  def write(register, index, val) do
    put_elem(register, index, val)
  end

  # read from register
  def read(register, index) do
    elem(register, index)
  end
end
