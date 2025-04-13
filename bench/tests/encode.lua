local benchmark = require("bench.benchmark")
local lai = require("json")            -- github.com/laimadoo/json.lua
local rxi = require("bench.rxi_json")  -- github.com/rxi/json.lua

local data = {
    firstName = "John",
    lastName = "Smith",
    isAlive = true,
    age = 25,
    address = {
        streetAddress = "21 2nd Street",
        city = "New York",
        state = "NY",
        postalCode = "10021-3100"
    },
    phoneNumbers = {
        { type = "home", number = "212 555-1234" },
        { type = "office", number = "646 555-4567" }
    },
    children = {},
    spouse = nil
}

local r1 = benchmark(100, lai.encode, data)
local r2 = benchmark(100, rxi.encode, data)
print("time")
print("lai: " .. r1 .. " rxi: " .. r2)
print("diff lai - rxi")
print(r1-r2 "-- " .. (r1/r2) .. "%")