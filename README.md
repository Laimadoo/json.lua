# json.lua  
**A small and fast JSON library for Lua.**  

### Advantages  
- Pure Lua: works with Lua 5.1, 5.2, 5.3, 5.4, and LuaJIT  
- Fast: outperforms Rxi's implementation  
- Compact: under 300 lines of code and about 7 KB  
- Supports sparse arrays: for example, `[true, null, false]` becomes `{true, nil, false}`  
- Pretty-printing via `json.prettify(table, tab [text: " "])` for readable indented output  

### Usage  
**The library provides the following functions:**  
- `json.encode(value)` – *Encodes a Lua value into a JSON string.*  
- `json.encode({ 1, 2, 3, { x = 10 } })` – *Returns `[1,2,3,{"x":10}]`*  
- `json.decode(value [string])` – *Parses a JSON string into a Lua value.*  

```lua  
json.decode('[1,2,3,{"x":10}]') -- returns {1, 2, 3, { x = 10 }}  

json.prettify({1, 2, { x = 10 }}, "  ")  
-- Output:  
-- [1, 2, {  
--   "x":10  
-- }]  
```  

### Limitations  
- The library does not automatically fix or convert unsupported values (e.g., `NaN`, `-inf`, `inf`).  
- `null` values are converted to `nil` on decoding and thus get lost.  
- JSON syntax errors (like missing `,` or `:`) will not be handled gracefully.  
- On LuaJIT, `json.decode` performs slower than Rxi’s version.  

### License  
This library is fully open-source and may be freely used, distributed, and modified under the MIT license (or a similar one).