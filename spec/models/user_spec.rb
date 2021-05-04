require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # before do
  #   @user = User.create!({name: 'User', password: '123456', password_confirmation: '123456', email: 'user@email.com'})
  #   @user.save!
  # end

  describe 'Validations' do

    it "successfuly create a new user when all fields are provided" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user.valid?
      expect(user.errors.full_messages.empty?).to be true
    end

    it 'password and password_confirmation should match' do
      user = User.new(password: '123456',  password_confirmation: '123456')
      user.valid?
      expect(user.password).to eq(user.password_confirmation)
    end

    it "successfuly create a new user when providing password and password_confirmation" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user.valid?
      expect(user.errors.full_messages).to_not include("Password confirmation can't be blank","Password can't be blank")
    end

    it "fail to create a new user when not providing password" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: nil, password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "fail to create a new user when not providing password confirmation" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: nil, email: 'lucasribas1@email.com'})
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "successfuly create a new user when providing a unique email address" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: nil, password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user.valid?
      expect(user.errors.full_messages).to_not include("Email has already been taken")
    end

    it "fail to create a new user when not providing a unique email address (both lower case)" do
      user1 = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user2 = User.create({first_name: 'Test', last_name: 'User', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "fail to create a new user when not providing a unique email address (lower/upper case)" do
      user1 = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user2 = User.create({first_name: 'Test', last_name: 'User', password: '123456', password_confirmation: '123456', email: 'LUCASRIBAS1@email.com'})
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it ".authenticate_with_credentials" do
      user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas1@email.com'})
      user.valid?
      expect(user.authenticate_with_credentials("LUCASRIBAS1@email.com","123456")).to be_truthy
    end

  end


end
