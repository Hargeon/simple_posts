require 'rails_helper'

RSpec.describe User, type: :model do
  let(:us) { User.create(name: 'Test Capybara', email: 'test@@admin.com',
            password: '01234567', age: 20, gender: 'male') }
  it_behaves_like 'user example'
  describe 'validations' do
    it '@admin.com' do
      expect(us).not_to be_valid
    end
  end
end
