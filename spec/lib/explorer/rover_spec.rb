describe Explorer::Rover do

  describe ".new" do
    context "given plateau, initial coordinates and direction" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }
      before { @rover = Explorer::Rover.new(plateau, 1, 2, "N") }

      it "initializes a new instance of Rover" do
        expect(@rover).to be_a(Explorer::Rover)
      end
    end
  end

  describe "#process_instructions_and_report_coordinates!" do
    context "given a rover at x-1, y-2, facing N on a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }
      let(:rover)   { Explorer::Rover.new(plateau, 1, 2, "N") }

      context "when invoked with 'LMLMLMLMM'" do
        let(:instructions) { "LMLMLMLMM" }
        before { @output = rover.process_instructions_and_report_coordinates!(instructions) }

        it "should return '1 3 N'" do
          expect(@output).to eq('1 3 N')
        end
      end
    end

    context "given a rover at x-3, y-3, facing E on a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }
      let(:rover)   { Explorer::Rover.new(plateau, 3, 3, "E") }

      context "when invoked with 'MMRMMRMRRM'" do
        let(:instructions) { "MMRMMRMRRM" }
        before { @output = rover.process_instructions_and_report_coordinates!(instructions) }

        it "should return '5 1 E'" do
          expect(@output).to eq("5 1 E")
        end
      end
    end
  end

  describe "#update_direction!", :t do
    context "given a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }

      context "rover at x-1, y-2, facing N" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'N') }

        context "when invoked with 'L'" do
          before { @new_direction = rover.update_direction!("L") }

          it "returns 'W'" do
            expect(@new_direction).to eq("W")
          end
        end
      end
    end
  end

end