class Player
	def play_turn(warrior)
		@state ||= '1'
		space = warrior.feel
		if (@state == '1' and space.empty? and warrior.health < 20)
			@state = '2'
		elsif (@state == '2' and space.empty?)
			if (warrior.health < 20)
				warrior.rest!
				return nil
			else
				@state = '3'
			end
		end
		if (space.empty?)
			warrior.walk!
		elsif (space.enemy?)
			warrior.attack!
		elsif (space.captive?)
			warrior.rescue!
		end
	end
end  