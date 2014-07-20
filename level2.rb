class Player
  def play_turn(warrior)
    space = warrior.feel
    warrior.walk!   if space.empty?
    warrior.attack! if space.enemy?
  end
end
