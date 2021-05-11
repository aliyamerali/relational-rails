require 'rails_helper'

RSpec.describe Bartender, type: :model do
  describe 'relationships' do
    it { should have_many :drinks }
  end
end
  #
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
