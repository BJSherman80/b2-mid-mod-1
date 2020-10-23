require 'rails_helper'
RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to :park}
    it { should have_many :repairs}
    it { should have_many(:mechanics).through(:repairs)}
 end
end
