describe Explorer::Plateau do

  describe ".new" do
    context "given two coordinates" do
      before { @plateau = Explorer::Plateau.new(1, 1) }

      it "initializes a new instance of Plateau" do
        expect(@plateau).to be_a(Explorer::Plateau)
      end
    end
  end

  describe "#movable_coordinate?" do
    let(:plateau) { Explorer::Plateau.new(5, 5) }

    context "given coordinates inside plateau limits" do
      before { @result = plateau.movable_coordinate?(4, 4) }

      it "returns true" do
        expect(@result).to be(true)
      end
    end

    context "given negative x as coordinate" do
      before { @result = plateau.movable_coordinate?(-1, 4) }

      it "returns false" do
        expect(@result).to be(false)
      end
    end

    context "given negative y as coordinate" do
      before { @result = plateau.movable_coordinate?(4, -1) }

      it "returns false" do
        expect(@result).to be(false)
      end
    end

    context "given x beyond the limits as coordinate" do
      before { @result = plateau.movable_coordinate?(7, 4) }

      it "returns false" do
        expect(@result).to be(false)
      end
    end

    context "given y beyond the limits as coordinate" do
      before { @result = plateau.movable_coordinate?(4, 7) }

      it "returns false" do
        expect(@result).to be(false)
      end
    end
  end

end