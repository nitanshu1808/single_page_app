class Provider < ApplicationRecord
  # validations
  validates :name, :uid, presence: true
  # associations
  belongs_to :user
  # callbacks
  before_save :check_token_expiration, if: :token_expiration?

  # private methods 
  private
  # This method is used to verify that the token is not expired
  def check_token_expiration
    (token_expiration > Time.now.utc)
  end
end
