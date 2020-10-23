require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :repairs}
    it { should have_many(:rides).through(:repairs)}
  end
end
