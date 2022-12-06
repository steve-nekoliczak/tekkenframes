defmodule Tekkenframes.RegexHelper do
  @stance "(SS|SSR|SSL|WS|FC|TC|TJ)"
  @move_input "(u|u\/f|f|d\/f|d|d\/b|b|u\/b|U|U\/F|F|D\/F|D|D\/B|B|U\/B|N|qcb|qcf|hcb|hcf)"
  @attack_input "(1|1\\+2|1\\+2\\+3|1\\+2\\+3\\+4|2|2\\+3|2\\+3\\+4|3|3\\+4|4)"
  @input_entry "(#{@move_input}|#{@attack_input}|#{@move_input}\\+#{@attack_input})"
  @input "(#{@stance} )?#{@input_entry}(, #{@input_entry})*"
  def input_regex, do: ~r/^#{@input}$/

  def damage_regex, do: ~r/^\d*(, \d*)*$/

  @hit_level "(h|m|l)"
  @hit_level_entry "#{@hit_level}( \\(#{@stance}\\))?"
  def hit_level_regex, do: ~r/^(#{@hit_level_entry}(, #{@hit_level_entry})*\!?|\!)$/

  @frame_entry "(\\+|\-){1}\\d+"
  def frame_regex, do: ~r/^(#{@frame_entry}(~#{@frame_entry})?|Launch( \(JG\?\))?|Throw|KND)$/

  def start_up_regex, do: ~r/^\d+(~\d+)?$/
end
