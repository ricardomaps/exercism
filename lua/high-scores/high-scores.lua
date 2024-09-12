local HighScores = {}

function HighScores:scores()
  return self.values
end

function HighScores:latest()
  return self.values[#self.values]
end

function HighScores:personal_best()
  return math.max(table.unpack(self.values))
end

function HighScores:personal_top_three()
  local sorted_values = {}
  local best = {}
  table.move(self.values, 1, #self.values, 1, sorted_values)
  table.sort(sorted_values, function(a, b) return a > b end)
  table.move(sorted_values, 1, 3, 1, best)
  return best
end

return function(scores)
  local high_scores = { values = scores }
  setmetatable(high_scores, { __index = HighScores })

  -- TODO: store the scores in the high_scores object

  return high_scores
end
