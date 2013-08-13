p "loading user model..."

class User < ActiveRecord::Base
   attr_accessible :name, :password, :about
   validates :name, uniqueness: true, presence: true
   validates :password, presence: true, length: {minimum: 4}
   validates :about, length: {maximum: 250 }
   
   
   def create_session_token
     new_token = SecureRandom.urlsafe_base64
     self.session_token = new_token
     self.save
     new_token
   end
     
end
