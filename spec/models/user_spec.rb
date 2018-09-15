require 'rails_helper'

RSpec.describe User, type: :model do

  context "validate User attributes" do
    before(:all) do
      @user = User.new
    end

    it "save a user without a details" do
      expect(@user.save).to eql(false)
    end

    it "validate user email format" do
      @user.user_name = "nik"
      @user.email = "hello.con"
      expect(@user.save).to eql(false)
    end

  end

  context "validate User attributes" do
    before(:each) do
      data =  { user_name: 'nitanshu18',
          email:     'nitanshu1.nik@gmail.com',
          password:  'leo123456789'
        }

        @user = User.new(data)
    end

    it "create user" do
      expect(@user.save).to eql(true)
    end

    it "verifies password length" do
      expect(@user.password.length).to be >= 3
    end

    it "verifies user email format" do
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      expect(@user.email).to match(VALID_EMAIL_REGEX)
    end

  end  
end
