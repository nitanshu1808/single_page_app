require 'rails_helper'

RSpec.describe Provider, type: :model do
  it "validates provider" do
      build_provider    
      expect(@provider.save).to eql(false)
  end

  it "validates name" do
    build_provider
    @provider.valid?
    expect(@provider.errors.full_messages).to include(I18n.t("model.user.presence_req", {val: "Name"}))
  end

  it "validates uid" do
    build_provider
    @provider.valid?
    expect(@provider.errors.full_messages).to include(I18n.t("model.user.presence_req", {val: "Uid"}))
  end

  it "create provider" do
    build_provider
    @provider.attributes = {
      name: "facebook",
      uid:  "123456",
      token_expiration: 10.days.from_now.utc
    }

    expect(@provider.save).to eql(true)
  end

  def build_provider
    data =  { user_name: 'nitanshu18',
      email:     'nitansh@gmail.com',
      password:  'leo123456789'
    }

    user      = User.create(data)
    @provider = user.build_provider
  end
end
