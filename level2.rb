class Player
	def play_turn(warrior)
		space = warrior.feel
		if (space.empty?)
			warrior.walk!
		end
		if (space.enemy?)
			warrior.attack!
		end
	end
end  