class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self
  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true, uniqueness: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
