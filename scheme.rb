#!/usr/bin/ruby
require "./lib/application"
require "./lib/assignment"
require "./lib/apply"
require "./lib/check_parenthesis"
require "./lib/conditional"
require "./lib/definition"
require "./lib/is_lambda"
require "./lib/quoted"
require "./lib/self_evaluating"
require "./lib/variable"

file = File.open("schemeStuff.scm", "r")
contents = file.read

def eval (exp, env)
  exp = Check_parenthesis.remove_parenthesis(exp) #removes parenthesis
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
    expArray = Check_parenthesis.calculate_args(exp)
    
    arguments = expArray.drop(1)
    procedure = expArray[0]
    return Apply.apply(procedure, arguments)
  end

  return "TF" #Something is not correct here....
end




puts eval(contents,0)
