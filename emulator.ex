defmodule Emulator do

  # start the emulator from the given code.
  def start(code) do
    reg = Register.create()
    run(code, 0, reg, [])
  end

  # run the emulator.
  def run(code, pc, reg, output) do

    case Program.read(code, pc) do

      {:add, d, s1, s2} ->
        res = Register.read(reg, s1) + Register.read(reg, s2)
        reg = Register.write(reg, d, res)
        run(code, pc + 1, reg, output)

      {:addi, d, s1, imm} ->
        res = Register.read(reg, s1) + imm
        reg = Register.write(reg, d, res)
        run(code, pc + 1, reg, output)

      {:beq, s1, s2, offset} ->
        if Register.read(reg, s1) == Register.read(reg, s2) do
          run(code, pc + offset, reg, output)
        else
          run(code, pc + 1, reg, output)
        end

      {:out, s1} ->
        res = Register.read(reg, s1)
        output = add_output(output, res)
        run(code, pc + 1, reg, output)

      {:halt} ->
        get_output(output)

    end
  end

  # add a value to the output
  defp add_output([], val) do [val] end
  defp add_output(output, val) do [val | output] end

  # get output value
  defp get_output(l) do
    reverse(l, [])
  end

  defp reverse([], r) do r end
  defp reverse([h | t], r) do
    reverse(t, [h | r])
  end

end
