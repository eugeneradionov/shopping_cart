class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cart, class_name: 'ShoppingCart::Cart'
  has_one :user_info
  has_many :orders, class_name: 'ShoppingCart::Order'

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, length: { maximum: 63 }

  validate :password_validation

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email.split('@').first
    end
  end

  private

  def password_validation
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/)
      errors.add :password, 'must have at least 8 characters length, include at least one lowercase letter, one uppercase letter, and one digit'
    end
  end
end
