require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe 'relationships' do
    it { should belong_to(:bartender) }
  end
end

  # before :each do
  #
  # end
  #
  # describe 'class methods' do
  #   describe '.' do
  #   end
  # end
  #
  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
