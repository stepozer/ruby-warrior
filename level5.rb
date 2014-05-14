class Player
	def play_turn(warrior)
		@state ||= '1'
		space = warrior.feel
		if (@state == '1')
			if (space.empty?)
				warrior.walk!
			elsif (space.captive?)
				warrior.rescue!
				@state = '2'
			end
		elsif (@state == '2')
			if (space.empty?)
				warrior.walk!
				if (warrior.health < 20)
					@state = '3'
				end
			elsif (space.enemy?)
				warrior.attack!
			end
		elsif (@state == '3')
			if (space.empty?)
				if (warrior.health < 20)
					@state = '4'
				else
					warrior.walk!
				end
			elsif (space.enemy?)
				warrior.attack!
			end
		elsif (@state == '4')
			if (warrior.health < 20)
				warrior.rest!
			else
				@state = '5'
			end
		elsif (@state == '5')
			if (space.empty?)
				warrior.walk!
			elsif (space.enemy?)
				warrior.attack!
			elsif (space.captive?)
				warrior.rescue!
			end
		end
	end
end  