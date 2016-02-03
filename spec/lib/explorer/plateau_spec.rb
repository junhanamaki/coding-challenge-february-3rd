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

    context "given two coordinates inside plateau limits" do
      before { @result = plateau.movable_coordinate?(4, 4) }

      it "returns true" do
        expect(@result).to be(true)
      end
    end
  end

end