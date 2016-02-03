describe Explorer::Plateau do

  describe ".new" do
    context "given two coordinates" do
      before { @plateau = Explorer::Plateau.new(1, 1) }

      it "should initialize a new instance of Plateau" do
        expect(@plateau).to be_a(Plateau)
      end
    end
  end

end