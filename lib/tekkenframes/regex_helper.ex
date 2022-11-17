defmodule Tekkenframes.RegexHelper do
  @stance       "(SS|SSR|SSL|WS|FC)"
  @move_input   "(u|u\/f|f|d\/f|d|d\/b|b|u\/b|U|U\/F|F|D\/F|D|D\/B|B|U\/B|N|qcb|qcf|hcb|hcf)"
  @attack_input "(1|1\\+2|1\\+2\\+3|1\\+2\\+3\\+4|2|2\\+3|2\\+3\\+4|3|3\\+4|4)"
  @input        "(#{@move_input}|#{@attack_input}|#{@move_input}\\+#{@attack_input})"
  @move         "(#{@stance} )?#{@input}(, #{@input})*"

  def move_regex, do: ~r/^#{@move}$/
end
