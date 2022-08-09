# JSX.lua
Pure Lua converter from JSX/TSX to JavaScript or TypeScript using LPeg

## Example
```lua
jsx:match([[
  return (
    <button onClick={() => this.setState({ liked: true })}>
      Like
    </button>
  );
]])

-- Returns: 
-- [[
--   return (
--     React.createElement("button", {"onClick": (() => this.setState({ liked: true }))}, "Like")
--   );
-- ]]
```
