module Check_parenthesis
  def self.remove_parenthesis(exp)
    if(exp[0] === '(')
      return exp[1...-2]
    end
    return exp
  end

  def self.calculate_args(exp)
    #retVal = []
    for pos in 0..exp.length - 1
        puts exp[pos].chr
    end
  end
end
