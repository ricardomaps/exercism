import std/sets

proc sum*(limit: int, factors: openArray[int]): int =
  var multiples: HashSet[int]
  for n in factors:
    if n == 0:
      continue
    for multiple in countup(n, limit-1, n):
      multiples.incl(multiple)
  for m in multiples:
    result += m
