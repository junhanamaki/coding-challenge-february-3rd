describe Explorer::Rover do

  describe ".new" do
    context "given plateau, initial coordinates and direction" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }
      before { @rover = Explorer::Rover.new(plateau, 1, 2, 'N') }

      it "initializes a new instance of Rover" do
        expect(@rover).to be_a(Explorer::Rover)
      end
    end
  end

  describe "#explore" do
    context "given a rover at x-1, y-2, facing N on a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }
      let(:rover)   { Explorer::Rover.new(plateau, 1, 2, 'N') }

      context "when invoked with 'LMLMLMLMM'" do
        let(:instructions) { "LMLMLMLMM" }
        before { @output = rover.explore(instructions) }

        it "should return '1 3 N'" do
          expect(@output).to eq('1 3 N')
        end
      end
    end
  end

end