class Player
  def play_turn(warrior)
    @state ||= '1'
    space = warrior.feel
    if @state == '1' && space.empty? && warrior.health < 20
      @state = '2'
    elsif @state == '2' && space.empty?
      if warrior.health < 20
        warrior.rest!
        return nil
      else
        @state = '3'
      end
    end
    warrior.walk!   if space.empty?
    warrior.attack! if space.enemy?
    warrior.rescue! if space.captive?
  end
end
