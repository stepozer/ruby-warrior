class Player
  def play_turn(warrior)
    space = warrior.feel
    if warrior.health < 10 && space.empty?
      warrior.rest!
      return nil
    end
    warrior.walk!   if space.empty?
    warrior.attack! if space.enemy?
  end
end
