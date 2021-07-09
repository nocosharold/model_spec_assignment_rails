require 'rails_helper'

RSpec.describe User, type: :model do

  context 'With valid attributes' do
    it 'should save' do
      user = User.new(
            first_name: 'Harold',
            last_name: 'Nocos',
            email: 'haroldnocos@gmail.com'
      )
      expect(user).to be_valid
    end
  end

  context 'With invalid attributes' do
    it 'should not save if first_name field is blank' do
      user = User.new(
        first_name: '', 
        last_name: 'nocos', 
        email: 'harold@nocos.com'
      )
      expect(user).to be_invalid
    end

    it "should not save if last_name field is blank" do
      user = User.new(
        first_name: 'Harold',
        last_name: '',
        email: 'harold@nocos.com'
      )
      expect(user).to be_invalid
    end
  end

 context 'for email testing' do
    it "should not save if email already exists" do
      find_by_email = User.find_by(email: "harold@nocos.com")
      expect(find_by_email).to be_nil
    end

    it "should not save if invalid email format" do
      user = User.new(
        first_name: 'Harold',
        last_name: 'Nocos',
        email: 'harold'
      )
      expect(user).to be_invalid
    end
  end
end