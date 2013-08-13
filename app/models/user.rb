class User < ActiveRecord::Base
   attr_accessible :name, :password, :about
   validates :name, uniqueness: true, presence: true
   
   
   def create_session_token
     new_token = SecureRandom.urlsafe_base64
     self.sesion_token = new_token
     new_token
   end
     
end
