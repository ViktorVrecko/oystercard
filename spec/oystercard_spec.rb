# require "./lib/oystercard.rb" #if you dont use lib as folder
require "oystercard"

describe Oystercard do

  it "new Oystercard has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up!' do
    it 'adds money to the oystercard' do
      expect { subject.top_up!(10) }.to change{ subject.balance }.by 10
    end
  end

  describe "maximum limit" do
    it "raises an error if limit is exceeded" do
         
      described_class::CARD_LIMIT.times { subject.top_up!(1) }
      expect {subject.top_up! 1 }.to raise_error "Limit of #{described_class::CARD_LIMIT} reached" 
       
    end
  end     

end