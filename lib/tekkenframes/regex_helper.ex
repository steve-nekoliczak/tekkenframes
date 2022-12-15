defmodule Tekkenframes.RegexHelper do
  @moduledoc """
  Regexes to help validate moves. Used in the move model.
  """

  @stance           "(SS|SSR|SSL|WS|FC|TC|TJ)"
  @move_input       "(u|u\/f|f|d\/f|d|d\/b|b|u\/b|U|U\/F|F|D\/F|D|D\/B|B|U\/B|qcb|qcf|hcb|hcf)"
  @attack_input     "(1|1\\+2|1\\+2\\+3|1\\+2\\+3\\+4|1\\+3|1\\+3\\+4|1\\+4|2|2\\+3|2\\+3\\+4|2\\+4|3|3\\+4|4)"
  @input_entry      "(#{@move_input}|#{@attack_input}|#{@move_input}\\+#{@attack_input})"
  @input            "(#{@stance} )?#{@input_entry}(, (#{@input_entry}|N))*"
  @input_regex      ~r/^#{@input}$/
  def input_regex, do: @input_regex

  @damage_regex     ~r/^\d*(, \d*)*$/
  def damage_regex, do: @damage_regex

  @hit_level        "(h|m|l)"
  @hit_level_entry  "#{@hit_level}( \\(#{@stance}\\))?"
  @hit_level_regex  ~r/^(#{@hit_level_entry}(, #{@hit_level_entry})*\!?|\!)$/
  def hit_level_regex, do: @hit_level_regex

  @frames_entry      "((\\+|\-){1}\\d+|0)"
  @frames_regex       ~r/^(#{@frames_entry}(~#{@frames_entry})?)$/
  def frames_regex, do: @frames_regex

  @start_up_regex     ~r/^\d+(~\d+)?$/
  def start_up_regex, do: @start_up_regex
end
