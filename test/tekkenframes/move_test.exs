defmodule Tekkenframes.MoveTest do
  use Tekkenframes.DataCase, async: true
  alias Tekkenframes.Move
  import Tekkenframes.Factory

  describe "changeset/2" do
    test "succeeds when damage is a number" do
      move = insert(:move)
      changeset = Move.changeset(move, %{damage: "12"})

      assert %{} = errors_on(changeset)
      assert changeset.valid?
    end

    test "fails when damage is not a number" do
      move = insert(:move)
      changeset = Move.changeset(move, %{damage: "a"})

      assert %{damage: ["has invalid format"]} = errors_on(changeset)
      assert !changeset.valid?
    end
  end
end
