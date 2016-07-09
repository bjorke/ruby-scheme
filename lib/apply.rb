module Apply
  def self.apply(procedure, arguments)
    returnVal = Float(arguments[0]) #set the first input value to be the start
    if(procedure == '-')
      returnVal = returnVal - Float(arguments[0]) * 2
    end
    arguments = arguments.drop(1) #remove it so we dont't use it twice
    for i in arguments
      returnVal = returnVal.send(procedure,Float(i))
    end

    return returnVal
  end
end
