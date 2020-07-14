using Observables

# The factors to multiply
const factors = Observable((1,2))
# The entered and parsed result
const result = Observable(0)
# True if the result is correct
const success = Observable(false)

# Translate the problem to a nice string
function makeprompt(f)
  a,b = f
  return "$a × $b = ?"
end

# String representation of the problem
const prompt = Observable(makeprompt(factors[]))
const statusstring = Observable("")
const resultstring = Observable("")

# Update the prompt when the factors change
on(factors) do f
  prompt[] = makeprompt(f)
end

# Evaluate correctness of result
on(result) do r
  success[] =  (r == prod(factors[]))
end

# Give a new problem if correct
on(success) do s
  if s
    factors[] = (rand((2,5,10)), rand(1:10))
    statusstring[] = "Correct!"
  else
    statusstring[] = "Incorrect!"
  end
end

# Parse string input
on(resultstring) do s
  result[] = parse(Int, s)
end
