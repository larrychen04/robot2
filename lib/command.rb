class Command
   def initialize(name=nil, x=nil, y=nil, face=nil)
    	@name, @x, @y, @face = name, x, y, face
    	validateCommand
   end

	def x
		@x
	end

	def y
		@y
	end

	def face
		@face
	end

	def name
		@name
	end

	def validateCommand
		if !validateCommandName @name
			resetInitValue
		end
		if (@name == 'PLACE') && !(validateArea(@x) && validateArea(@y) && validateFace(@face)) 
        	resetInitValue
		end
	end

	def validateArea area
		if area.nil? || area < 0 || area > 5
			return false
		else
			return true
		end
	end

	def validateCommandName name
		return ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT'].include?(name)
	end

	def validateFace face
		return ['NORTH', 'SOUTH', 'EAST', 'WEST'].include?(face)
	end

   def resetInitValue
      @name, @x, @y, @face = nil, nil, nil, nil
   end
end