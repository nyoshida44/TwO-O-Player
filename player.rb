class Player
  attr_accessor :lives, :turn

  def initialize
    @lives = 3
    @turn = false
  end
end