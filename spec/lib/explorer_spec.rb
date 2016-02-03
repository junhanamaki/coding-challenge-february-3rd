require 'open3'

describe "bin/explorer" do

  context "given content in sample/test1.input", :t do
    before { _, @stdout = Open3.popen3('bin/explorer < sample/test1.input') }
    after { @stdout.close }

    it "should output context of sample/test1.output" do
      File.open("sample/test1.output") do |file|
        file.each { |line| expect(line).to eq(@stdout.gets) }
      end
    end
  end

end