require "command"

describe Command do 
	it "Area can not be nil" do
		expect(Command.new().validateArea(nil)).to eq(false)
	end
	it "Area can not be larger than 5" do
		expect(Command.new().validateArea(6)).to eq(false)
	end
	it "Area can not be less than 0" do
		expect(Command.new().validateArea(-1)).to eq(false)
	end
	it "Area must be between 0 to 5" do
		expect(Command.new().validateArea(0)).to eq(true)
	end
	it "If command name is 'PLACE', should be return true" do
		expect(Command.new().validateCommandName('PLACE')).to eq(true)
	end
	it "If command name is 'test', should be return false" do
		expect(Command.new().validateCommandName('test')).to eq(false)
	end
	it "If face is 'NORTH', should be return true" do
		expect(Command.new().validateFace('NORTH')).to eq(true)
	end
	it "If face is 'test', should be return false" do
		expect(Command.new().validateFace('test')).to eq(false)
	end
	it "Init command name 'MOVE', after resetInitValue, command name is nil " do
		command = Command.new('PLACE', 2, 2, 'NORTH')
		expect(command.name).to eq('PLACE')
		command.resetInitValue
		expect(command.name).to eq(nil)
	end
	it "Face is wrong name in PLACE Command" do
		command = Command.new("PLACE", 1, 1, "NORTH2")
		expect(command.name).to eq(nil)
	end
	it "Every thing is correct in PLACE Command" do
		command = Command.new("PLACE", 1, 1, "NORTH")
		expect(command.name).to eq("PLACE")
	end
	it "Command name is wrong" do
		command = Command.new("test", 1, 1, "NORTH")
		expect(command.name).to eq(nil)
	end
end