class Player
	def play_turn(warrior)
		@state     ||= :backward
		@direction ||= :backward
		
		space = warrior.feel @direction

		if (@state == :forward and warrior.health < 10) 
			warrior.walk! :backward
			@state = :rest
			return nil;
		end
		if (@state == :rest) 
			if (warrior.health < 20)
				warrior.rest!
			else
				@state = :kill_all
			end
			return nil;
		end
			
		if (space.empty?)
			warrior.walk! @direction
		elsif (space.enemy?)
			warrior.attack!
		elsif (space.captive?)
			warrior.rescue! @direction
			@state     = :forward
			@direction = :forward
		end
	end
end  