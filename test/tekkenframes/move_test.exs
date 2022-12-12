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
end
