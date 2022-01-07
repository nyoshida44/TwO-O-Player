class Question
  attr_reader :newQuestion, :answer

  def initialize
    num1 = rand(1..10)
    num2 = rand(1..10)
    @newQuestion = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end
end