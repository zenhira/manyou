class User < ApplicationRecord
  before_validation :ensure_has_name
  after_update :update_admin_count
  before_destroy :destroy_admin_count

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  # validates :password_digest, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }

  has_many :tasks, dependent: :destroy

  private

  def ensure_has_name
    self.name = 'NoNameUser' if name.blank?
  end

  def destroy_admin_count
    throw(:abort) if User.where(admin: true).length == 1 && self.admin?
  end

  def update_admin_count
    throw(:abort) if User.where(admin: true).length == 0
  end
end

# def self.new_remember_token
#   SecureRandom.urlsafe_base64
# end

# def self.encrypt(token)
#   Digest::SHA256.hexdigest(token.to_s)
# end

