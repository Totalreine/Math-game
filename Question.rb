class Question

attr_reader :question, :answer
    
 def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @question = "What does #{@number1.to_s} plus #{@number2.to_s} equal?"
    @answer = @number1.to_i + @number2.to_i
 end
end
