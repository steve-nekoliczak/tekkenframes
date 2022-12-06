# Tekkenframes

## Debugging Tests

```
# In the test you want to debug
# At the top
require IEx
# Where you want your breakpoint
IEx.pry

# Run tests
iex -S mix test
# Run a specific test
iex -S mix test test/tekkenframes/move_test.ex
```
