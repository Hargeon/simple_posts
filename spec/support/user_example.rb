RSpec.shared_examples 'user example' do
  describe 'validations' do
    it { should allow_value('Ilya Dzemyanets').for(:name) }
    it { should_not allow_values('Ilya dzemyanets', 'ilya Dzemyanets', 'ilya dzemuanets').for(:name) }
    it { should allow_values(1, 50, 100, 150).for(:age) }
    it { should_not allow_values(-1, 200).for(:age) }
    it { should allow_values('male', 'female').for(:gender) }
    it { should_not allow_values('some text', 'Male', 'Female').for(:gender) }
    it { should validate_inclusion_of(:gender).in_array(['male', 'female']).with_message('Only male/female') }
  end
end
