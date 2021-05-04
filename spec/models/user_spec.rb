require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # before do
  #   @user = User.create!({name: 'User', password: '123456', password_confirmation: '123456', email: 'user@email.com'})
  #   @user.save!
  # end

  describe 'Validations' do

    it "successfuly create a new user when providing password and password_confirmation"
    user = User.create({first_name: 'Lucas', last_name: 'Ribas', password: '123456', password_confirmation: '123456', email: 'lucasribas@email.com'})
    p user.errors_full_messages
    #expect(user.errors.full_messages)

  end


end

