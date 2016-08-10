class User < ApplicationRecord
has_secure_password
has_many :orders
validates :name, length: { minimum: 2 }
validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 6..40}
end
