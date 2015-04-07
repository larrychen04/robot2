require "robot"

describe Robot do 
	before do
		@command = Command.new('PLACE', 1, 2, 'EAST')
  	end
  	
	it "addCommand, @commands length become to 1" do
		robot = Robot.new
		robot.addCommand
		expect(robot.commands.length ).to eq(1)
	end

	it "After moveCommand, report should be 2 2 EAST" do
		robot = Robot.new
		robot.placeCommand @command
		robot.moveCommand
		expect(robot.reportCommand ).to include "2 2 EAST"
	end	

	it "After leftCommand, report should be 1 2 NORTH" do
		robot = Robot.new
		robot.placeCommand @command
		robot.leftCommand
		expect(robot.reportCommand ).to include "1 2 NORTH"
	end

	it "After rightCommand,report should be 1 2 SOUTH" do
		robot = Robot.new
		robot.placeCommand @command
		robot.rightCommand
		expect(robot.reportCommand ).to include "1 2 SOUTH"
	end

	it "robot is outside of table" do
		robot = Robot.new
		robot.placeCommand Command.new('PLACE', -1, 2, 'EAST')
		expect(robot.validatePlace ).to eq(false)
	end

	it "robot is inside of table" do
		robot = Robot.new
		robot.placeCommand @command
		expect(robot.validatePlace ).to eq(true)
	end

	it "After rollbackMoveCommand, report should be 1 2 SOUTH" do
		robot = Robot.new
		robot.placeCommand @command
		robot.moveCommand
		robot.rollbackMoveCommand
		expect(robot.reportCommand ).to include "1 2 EAST"
	end

	it "After three actions, report should be 0 1 NORTH " do
		@commands = Array.new
		command = Command.new('PLACE', 0, 0, 'NORTH')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('REPORT')
		@commands.push(command)
		robot = Robot.new
		expect(robot.action @commands).to include "0 1 NORTH"
	end

	it "Action start after placeCommand, report should be 0 1 NORTH " do
		@commands = Array.new
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('PLACE', 0, 0, 'NORTH')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('REPORT')
		@commands.push(command)
		robot = Robot.new
		expect(robot.action @commands).to include "0 1 NORTH"
	end

	it "Multiple placeCommands, report should be 0 0 NORTH " do
		@commands = Array.new
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('PLACE', 0, 0, 'NORTH')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('PLACE', 0, 0, 'NORTH')
		@commands.push(command)
		command = Command.new('REPORT')
		@commands.push(command)
		robot = Robot.new
		expect(robot.action @commands).to include "0 0 NORTH"
	end

	it "Stop robot to fall down table, report should be 0 0 NORTH " do
		@commands = Array.new
		command = Command.new('PLACE', 0, 0, 'WEST')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('RIGHT')
		@commands.push(command)
		command = Command.new('REPORT')
		@commands.push(command)
		robot = Robot.new
		expect(robot.action @commands).to include "0 0 NORTH"
	end

	it "Test for example b, report should be 0 0 NORTH " do
		@commands = Array.new
		command = Command.new('PLACE', 0, 0, 'NORTH')
		@commands.push(command)
		command = Command.new('LEFT')
		@commands.push(command)
		command = Command.new('REPORT')
		@commands.push(command)
		robot = Robot.new
		expect(robot.action @commands).to include "0 0 WEST"
	end

	it "Stop robot to fall down table, report should be 0 0 NORTH " do
		@commands = Array.new
		command = Command.new('PLACE', 1, 2, 'EAST')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('LEFT')
		@commands.push(command)
		command = Command.new('MOVE')
		@commands.push(command)
		command = Command.new('REPORT')
		@commands.push(command)
		robot = Robot.new
		expect(robot.action @commands).to include "3 3 NORTH"
	end
end