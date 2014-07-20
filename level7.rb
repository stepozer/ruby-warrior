class Player
  def play_turn(warrior)
    @state  ||= :forward
    @space    = warrior.feel

    if @state == :forward && @space.wall?
      warrior.pivot!
      @state = :backward
      return nil
    end
    if @state == :backward && warrior.health < 10
      warrior.walk! :backward
      @state = :rest
      return nil
    end
    if @state == :rest
      if warrior.health < 20
        warrior.rest!
      else
        @state = :kill_all
      end
      return nil
    end

    if @space.empty?
      warrior.walk!
    elsif @space.enemy?
      warrior.attack!
    end
  end
end
