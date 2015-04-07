require "#{File.dirname(__FILE__)}/lib/robot"

robot = Robot.new()
puts robot.robotAction ARGV[0], "#{File.dirname(__FILE__)}/#{ARGV[1]}"
