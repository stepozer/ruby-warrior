class Player
	def play_turn(warrior)
		space = warrior.feel

		if (@state == :kill_1)
			warrior.shoot!
			@state = :kill_2
			return nil
		end
		if (@state == :kill_2)
			warrior.shoot!
			@state = :all_killed
			return nil
		end

		if (space.empty?)
			warrior.walk!
		elsif (space.enemy?)
			warrior.attack!
		elsif (space.captive?)
			warrior.rescue!
			@state = :kill_1
		end
	end
end  