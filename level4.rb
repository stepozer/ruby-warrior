class Player
  def play_turn(warrior)
    space = warrior.feel
    if (warrior.health < 20 && warrior.health != 8 && space.empty?) || warrior.health == 5
      warrior.rest!
      return nil
    end
    warrior.walk!   if space.empty?
    warrior.attack! if space.enemy?
  end
end
