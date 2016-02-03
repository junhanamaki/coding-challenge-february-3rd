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

  describe "#current_coordinates" do
    context "given a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }

      context "rover at x1, y2, facing N" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'N') }
        before { @result = rover.current_coordinates }

        it "returns '1 2 N'" do
          expect(@result).to eq("1 2 N")
        end
      end
    end
  end

  describe "#process_instructions_and_report_coordinates!" do
    context "given a rover at x1, y2, facing N on a plateau of 6x6" do
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

    context "given a rover at x3, y3, facing E on a plateau of 6x6" do
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

  describe "#update_direction!" do
    context "given a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }

      context "rover at x1, y2, facing N" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'N') }

        context "when invoked with 'L'" do
          before { @new_direction = rover.update_direction!("L") }

          it "returns 'W'" do
            expect(@new_direction).to eq("W")
          end
        end

        context "when invoked with 'R'" do
          before { @new_direction = rover.update_direction!("R") }

          it "returns 'E'" do
            expect(@new_direction).to eq("E")
          end
        end
      end

      context "rover at x1, y2, facing W" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'W') }

        context "when invoked with 'L'" do
          before { @new_direction = rover.update_direction!("L") }

          it "returns 'S'" do
            expect(@new_direction).to eq("S")
          end
        end

        context "when invoked with 'R'" do
          before { @new_direction = rover.update_direction!("R") }

          it "returns 'N'" do
            expect(@new_direction).to eq("N")
          end
        end
      end

      context "rover at x1, y2, facing S" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'S') }

        context "when invoked with 'L'" do
          before { @new_direction = rover.update_direction!("L") }

          it "returns 'E'" do
            expect(@new_direction).to eq("E")
          end
        end

        context "when invoked with 'R'" do
          before { @new_direction = rover.update_direction!("R") }

          it "returns 'W'" do
            expect(@new_direction).to eq("W")
          end
        end
      end

      context "rover at x1, y2, facing E" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'E') }

        context "when invoked with 'L'" do
          before { @new_direction = rover.update_direction!("L") }

          it "returns 'N'" do
            expect(@new_direction).to eq("N")
          end
        end

        context "when invoked with 'R'" do
          before { @new_direction = rover.update_direction!("R") }

          it "returns 'S'" do
            expect(@new_direction).to eq("S")
          end
        end
      end
    end
  end

  describe "#move_forward!" do
    context "given a plateau of 6x6" do
      let(:plateau) { Explorer::Plateau.new(5, 5) }

      context "rover at x1, y2, facing N" do
        let(:rover) { Explorer::Rover.new(plateau, 1, 2, 'N') }
        before { rover.move_forward! }

        it "moves to coordinates '1 3 N'" do
          expect(rover.current_coordinates).to eq("1 3 N")
        end
      end

      context "rover at x6, y6, facing N" do
        let(:rover) { Explorer::Rover.new(plateau, 6, 6, 'N') }
        before { rover.move_forward! }

        it "does not move to a new coordinate" do
          expect(rover.current_coordinates).to eq("6 6 N")
        end
      end
    end
  end

end