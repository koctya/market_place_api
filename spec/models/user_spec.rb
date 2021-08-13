require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  # it { should validate_uniqueness_of(:email) }
  context 'with valid email' do
    let(:user) {User.new(email: 'test@test.org', password_digest: 'test')}
    it 'is valid' do
      expect(user).to be_valid
    end
  end
  context 'with invalid email' do
    let(:user) {User.new(email: 'test', password_digest: 'test')}
    it 'is invalid' do
      expect(user).to_not be_valid
    end
  end
  context 'with duplicate email' do
    let(:user) {User.new(email: 'test@test.org', password_digest: 'test')}
    let(:user2) {User.new(email: 'test@test.org', password_digest: 'test2')}
    xit 'is invalid' do
      expect(user2).to_not be_valid
    end
  end
end
