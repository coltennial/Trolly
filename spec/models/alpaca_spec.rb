require 'rails_helper'

RSpec.describe Alpaca, type: :model do
  let(:alpaca) { FactoryBot.create(:alpaca) }
  let(:sad_alpaca) { FactoryBot.create(:alpaca, fluffy: false) }

  
  describe 'actions' do 

    it 'embrace humans if fluffy' do 
      expect(alpaca.embrace).to eq('Hi')
    end 

    it 'bashful torwards humans if not fluffy' do 
      expect(sad_alpaca.bashful).to eq(true)
    end 
  end 



  describe "validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_uniqueness_of(:color) }
  end 



  describe "Class  Methods" do 
    before (:each) do 
      @alpaca1 = FactoryBot.create(:alpaca, color: "Blue", age: 3)
      @alpaca2 = FactoryBot.create(:alpaca, name: "Michael", color: "Lavender", age: 4)
      @alpaca3 = FactoryBot.create(:alpaca, name: "Gunther", color: "Green", age: 7, fluffy: true)
    end
  
    it "sorts by name" do 
      pacs = Alpaca.by_name 
      expect(pacs).to eq([@alpaca3, @alpaca2, @alpaca1])
    end 

    it "sorts by age" do 
      pacs = Alpaca.by_age 
      expect(pacs).to eq([@alpaca1, @alpaca2, @alpaca3])
    end 
  end


  describe "Instance Methods" do 
    before(:each) do 
      @attr = {
        name: "Karl",
        color: "Violet",
        age: 12,
        fluffy: true
      }
      @alpaca = FactoryBot.create(:alpaca, @attr)
    end

    it "it dyes the alpaca" do 
      @alpaca.dye("red")
      expect(@alpaca.color).to eq("red")
    end

    it "returns a hash of values" do 
      expect(@alpaca.info).to eq(@attr.with_indifferent_access)
    end
  end 

  
end
