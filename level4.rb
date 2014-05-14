class Player
	def play_turn(warrior)
		space = warrior.feel
		if ((warrior.health < 20 and warrior.health != 8 and space.empty?) or warrior.health == 5)
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