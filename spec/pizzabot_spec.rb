RSpec.describe Pizzabot::DeliveryRobot do
  describe 'Challenge tests' do
    it 'has correct instruction string for given input string' do
      string = Pizzabot::DeliveryRobot.new('5x5 (1, 3) (4, 4)')
      expect(string.delivery).to eq 'ENNNDEEEND'
    end

    it 'has correct instruction string for given challenge input string' do
      string = Pizzabot::DeliveryRobot.new('5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)')
      expect(string.delivery).to eq 'ENNNDEEENDSSDDWWWWSDEEENDWNDEESSD'
    end
  end

  describe 'Grid tests' do
    it "has invalid grid size, the input has not contain 'x'" do
      string = Pizzabot::DeliveryRobot.new('5-5 (1, 3) (4, 4)')
      expect(string.delivery).to eq 'Invalid grid size!'
    end

    it 'has invalid grid size, the input have number(s) greater than 9' do
      string = Pizzabot::DeliveryRobot.new('5x18 (1, 3) (4, 4)')
      expect(string.delivery).to eq 'Invalid grid size!'
    end

    it 'has valid grid size, if first number is not equal with second number' do
      string = Pizzabot::DeliveryRobot.new('3x6 (1,1)')
      expect(string.delivery).to eq 'END'
    end
  end

  describe 'Coordinates tests' do
    it 'has invalid coordinates for inputed string without coordinates' do
      string = Pizzabot::DeliveryRobot.new('6x6')
      expect(string.delivery).to eq 'Invalid coordinates!'
    end

    it 'has empty string for multiple inputs (0,0)' do
      string = Pizzabot::DeliveryRobot.new('4x4 (0, 0) (0, 0) (0, 0)')
      expect(string.delivery).to eq ''
    end

    it 'has skip (0,0) and continue to other houses' do
      string = Pizzabot::DeliveryRobot.new('7x7 (0, 0) (1, 5) (0, 0) (4, 0)')
      expect(string.delivery).to eq 'ENNNNNDEEESSSSSD'
    end

    it 'has invalid coordinates, greater then grid size' do
      string = Pizzabot::DeliveryRobot.new('5x5 (1, 6) (8, 4)')
      expect(string.delivery).to eq 'Invalid coordinates!'
    end

    it 'has invalid coordinates if inputed string has coordinate(s) greater than 9' do
      string = Pizzabot::DeliveryRobot.new('6x6 (1, 13) (14, 4)')
      expect(string.delivery).to eq 'Invalid coordinates!'
    end
  end
end
