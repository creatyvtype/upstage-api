class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable,
        :recoverable, :trackable, :validatable
        
    has_attached_file :image, styles: { medium: "600x200>", thumb: "300x200>" }, 
        default_url: "https://s-media-cache-ak0.pinimg.com/564x/6c/28/c1/6c28c1644b26303b67cd2879355e8d0a.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates :auth_token, uniqueness: true

    validates :first_name, :last_name, presence: true

    before_create :sanitize_email
    after_create :generate_authentication_token!

    def generate_authentication_token!
        begin
            self.auth_token = "#{self.id}:#{Devise.friendly_token}"
        end while self.class.exists?(auth_token: auth_token)
        save
    end

    def sanitize_email
        self.email = email.downcase
    end
end
