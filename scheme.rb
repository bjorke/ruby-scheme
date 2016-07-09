#!/usr/bin/ruby
require "./lib/application"
require "./lib/assignment"
require "./lib/conditional"
require "./lib/definition"
require "./lib/is_lambda"
require "./lib/quoted"
require "./lib/self_evaluating"
require "./lib/variable"
require "./lib/apply"

file = File.open("schemeStuff.scm", "r")
contents = file.read

def eval (exp, env)
  if Self_evaluating.self_evaluating(exp) #checks if it is a double/number
    return exp
  elsif Quoted.quoted(exp)
    return exp
  elsif Variable.variable(exp)
    return exp
  elsif Definition.definition(exp)
    return exp
  elsif Assignment.assignment(exp)
    return exp
  elsif Is_lambda.is_lambda(exp)
    return exp
  elsif Conditional.conditional(exp)
    return exp
  elsif Application.application(exp)
    return exp

  if Apply.apply(exp)
    return exp
  end
  else
    return "TF"
  end
end



puts eval(contents,0)
