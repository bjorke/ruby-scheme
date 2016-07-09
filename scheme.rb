#!/usr/bin/ruby
require "./lib/application"
require "./lib/assignment"
require "./lib/conditional"
require "./lib/definition"
require "./lib/is_lambda"
require "./lib/quoted"
require "./lib/self_evaluating"
require "./lib/variable"

file = File.open("schemeStuff.scm", "r")
contents = file.read

def eval (exp, env)
  if Self_evaluating.self_evaluating(exp) #checks if it is a double/number
    return exp
  end
  if Quoted.quoted(exp)
    return exp
  end
  if Variable.variable(exp)
    return exp
  end
  if Definition.definition(exp)
    return exp
  end
  if Assignment.assignment(exp)
    return exp
  end
  if Is_lambda.is_lambda(exp)
    return exp
  end
  if Conditional.conditional(exp)
    return exp
  end
  if Application.application(exp)
    return exp
  end


  return "TF"
end

def apply(procedure, arguments)
  return false
end

puts eval(contents,0)
