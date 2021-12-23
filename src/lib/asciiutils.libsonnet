// Modified versions of ascii case utilities that work on arbitrarily nested
// arrays

local utils = import 'utils.libsonnet';


local asciiLower = function(strOrArr)
  if std.isArray(strOrArr) then
    [
      asciiLower(element)
      for element in strOrArr
    ]
  else
    std.asciiLower(strOrArr);


local asciiUpper = function(strOrArr)
  if std.isArray(strOrArr) then
    [
      asciiUpper(element)
      for element in strOrArr
    ]
  else
    std.asciiUpper(strOrArr);


local asciiCapitalise = function(strOrArr)
  if std.isArray(strOrArr) then
    [
      asciiCapitalise(element)
      for element in strOrArr
    ]
  else
    local strs = std.stringChars(strOrArr);
    local firstChar = std.asciiUpper(strs[0]);

    local newStrs = [firstChar] + strs[1:];

    std.join("", newStrs);

{
  asciiLower: asciiLower,
  asciiUpper: asciiUpper,
  asciiCapitalise: asciiCapitalise,
}