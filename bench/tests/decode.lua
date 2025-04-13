local benchmark = require("bench.benchmark")
local lai = require("json")            -- github.com/laimadoo/json.lua
local rxi = require("bench.rxi_json")  -- github.com/rxi/json.lua

local text = "[" .. string.rep([[{
    "firstName": "John",
   "lastName": "Smith",
    "isAlive": true,
    "age": 25,
    "address": {
        "streetAddress": "21 2nd Street",
        "city": "New York",
        "state": "NY",
        "postalCode": "10021-3100"
    },
    "phoneNumbers": [
        {
            "type": "home",
            "number": "212 555-1234"
        },
        {
            "type": "office",
            "number": "646 555-4567"
        }
    ],
    "children": [],
    "spouse": null
}, ]], 1000) .. "]"

local r1 = benchmark(1, lai.decode, text)
local r2 = benchmark(1, rxi.decode, text)

local diff  = string.format("%.02f", r1-r2)
local diffp = string.format("%.02f", (math.abs(r1/r2) - 1)*100)

print("BENCHMARK [DECODE]")
print("time")
print("lai: " .. r1 .. " rxi: " .. r2)
print("diff lai - rxi")
print(diff .. " -- " .. diffp .. "%")