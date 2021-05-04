require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # before do
  #   @user = User.create!({name: 'User', password: '123456', password_confirmation: '123456', email: 'user@email.com'})
  #   @user.save!
  # end

  describe 'Validations' do

    it "successfuly create a new user when providing password and password_confirmation" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      expect(user.errors.full_messages).to_not include("Password confirmation can't be blank","Password can't be blank")
    end

    it "fail to create a new user when not providing password" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: nil, password_confirmation: '123456', email: 'lucasribas1@email.com'})
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "fail to create a new user when not providing password confirmation" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: nil, email: 'lucasribas1@email.com'})
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

  end


end

