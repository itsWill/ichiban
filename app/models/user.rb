class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password
end
