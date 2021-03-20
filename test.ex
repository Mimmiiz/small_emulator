defmodule Test do

  def test do
    prog = [
      {:addi, 1, 0, 10},
      {:addi, 3, 0, 1},
      {:out, 3},
      {:addi, 1, 1, -1},
      {:addi, 4, 3, 0},
      {:add, 3, 2, 3},
      {:out, 3},
      {:beq, 1, 0, 3},
      {:addi, 2, 4, 0},
      {:beq, 0, 0, -6},
      {:halt}
    ]

    Emulator.start(prog)

  end
end
