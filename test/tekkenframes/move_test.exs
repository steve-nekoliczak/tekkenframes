defmodule Tekkenframes.MoveTest do
  use Tekkenframes.DataCase, async: true
  alias Tekkenframes.Move
  import Tekkenframes.Factory

  describe "changeset/2: changing damage" do
    test "succeeds when damage is a number" do
      attrs = %{damage: "12"}
      changeset = Move.changeset(insert(:move), attrs)
      assert changeset.valid?
    end

    test "succeeds when damage is a series of numbers separated by commas and spaces" do
      attrs = %{damage: "12, 12"}
      changeset = Move.changeset(insert(:move), attrs)
      assert changeset.valid?
    end

    test "fails when damage is not a number" do
      attrs = %{damage: "a"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end

    test "fails when damage is a series of numbers with commas but no spaces" do
      attrs = %{damage: "12,13"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end

    test "fails when damage is a series of numbers with spaces but no commas" do
      attrs = %{damage: "12 13"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end
  end

  describe "changeset/2: changing hit_level" do
    test "succeeds when hit_level is h" do
      attrs = %{hit_level: "h"}
      changeset = Move.changeset(insert(:move), attrs)
      assert changeset.valid?
    end

    test "succeeds when hit_level is m" do
      attrs = %{hit_level: "m"}
      changeset = Move.changeset(insert(:move), attrs)
      assert changeset.valid?
    end

    test "succeeds when hit_level is l" do
      attrs = %{hit_level: "l"}
      changeset = Move.changeset(insert(:move), attrs)
      assert changeset.valid?
    end

    test "succeeds when hit_level is a series of h/m/l separated by commas and spaces" do
      attrs = %{hit_level: "h, m, l"}
      changeset = Move.changeset(insert(:move), attrs)
      assert changeset.valid?
    end

    test "fails when hit_level is not h/m/l" do
      attrs = %{hit_level: "b"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end

    test "fails when hit_level is a series of h/m/l with commas but no spaces" do
      attrs = %{hit_level: "h,m"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end

    test "fails when hit_level is a series of h/m/l with spaces but no commas" do
      attrs = %{hit_level: "h m"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end

    test "fails when hit_level is a series of characters including not h/m/l separated by commas and spaces" do
      attrs = %{hit_level: "h, m, x, l"}
      changeset = Move.changeset(insert(:move), attrs)
      assert !changeset.valid?
    end
  end

  describe "changeset/2: changing input" do
    @attack_inputs ~W<1 1+2 1+2+3 1+2+3+4 1+3 1+3+4 1+4 2 2+3 2+3+4 2+4 3 3+4 4>
    @move_inputs ~W<u u/f f d/f d d/b b u/b U U/F F D/F D D/B B U/B qcb qcf hcb hcf>
    @stances ~W<SS SSR SSL WS FC TC TJ>

    test "succeeds when input is any combination of ascending 1/2/3/4 with separating plus signs" do
      for attack_input <- @attack_inputs do
        changeset = Move.changeset(insert(:move), %{input: attack_input})
        assert changeset.valid?
      end
    end

    test "succeeds when input is any combination of ascending 1/2/3/4 with separating plus signs followed by a tilde to indicate a roll input" do
      for attack_input <- @attack_inputs do
        changeset = Move.changeset(insert(:move), %{input: "#{attack_input}~#{attack_input}"})
        assert changeset.valid?
      end
    end

    test "succeeds when input is a valid move input followed by a plus and an attack input" do
      for move_input <- @move_inputs do
        changeset = Move.changeset(insert(:move), %{input: "#{move_input}+1"})
        assert changeset.valid?
      end
    end

    test "succeeds when input is a valid stance followed by a space and an attack input" do
      for stance <- @stances do
        changeset = Move.changeset(insert(:move), %{input: "#{stance} 1"})
        assert changeset.valid?
      end
    end

    test "succeeds when input is a valid stance followed by a space, move input, plus, and an attack input" do
      for stance <- @stances, move_input <- @move_inputs do
        changeset = Move.changeset(insert(:move), %{input: "#{stance} #{move_input}+1"})
        assert changeset.valid?
      end
    end

    test "succeeds when input is ewgf" do
      for attack_input <- @attack_inputs do
        changeset = Move.changeset(insert(:move), %{input: "f, N, d, d/f+#{attack_input}"})
        assert changeset.valid?
      end
    end
  end

  describe "changeset/2: changing *_frames (excluding start_up_frames)" do
    @frames_fields ~W<on_block_frames on_hit_frames on_counter_hit_frames>a

    test "succeeds when *_frames is a positive number" do
      for frames_field <- @frames_fields do
        changeset = Move.changeset(insert(:move), %{frames_field => "+20"})
        assert changeset.valid?
      end
    end

    test "succeeds when *_frames is a negative number" do
      for frames_field <- @frames_fields do
        changeset = Move.changeset(insert(:move), %{frames_field => "-20"})
        assert changeset.valid?
      end
    end

    test "succeeds when *_frames is 0" do
      for frames_field <- @frames_fields do
        changeset = Move.changeset(insert(:move), %{frames_field => "0"})
        assert changeset.valid?
      end
    end

    test "succeeds when *_frames is 0 to positive number" do
      for frames_field <- @frames_fields do
        changeset = Move.changeset(insert(:move), %{frames_field => "0 - +2"})
        assert changeset.valid?
      end
    end

    test "succeeds when *_frames is a negative number to 0" do
      for frames_field <- @frames_fields do
        changeset = Move.changeset(insert(:move), %{frames_field => "-2 - 0"})
        assert changeset.valid?
      end
    end

    test "succeeds when *_frames is a negative number to a positive number" do
      for frames_field <- @frames_fields do
        changeset = Move.changeset(insert(:move), %{frames_field => "-2 - +2"})
        assert changeset.valid?
      end
    end
  end

  describe "changeset/2: changing *_effects" do
    @effects_fields ~W<on_block_effects on_hit_effects on_counter_hit_effects>
    @effects ~W<Knockdown Launch Crouch Throw>

    test "succeeds when *_effects is a valid effect" do
      for effects_field <- @effects_fields, effect <- @effects do
        changeset = Move.changeset(insert(:move), %{effects_field => effect})
        assert changeset.valid?
      end
    end
  end
end
