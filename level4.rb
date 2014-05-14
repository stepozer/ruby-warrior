class Player
	def play_turn(warrior)
		space = warrior.feel
		if (warrior.health < 10 and space.empty?)
			warrior.rest!
			return nil
		end
		if (space.empty?)
			warrior.walk!
		end
		if (space.enemy?)
			warrior.attack!
		end
	end
end  