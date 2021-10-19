require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("Hello world")
      expect(peeps).to include("I need coffee")
    end
  end
end
