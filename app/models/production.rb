class Production < ApplicationRecord
    has_attached_file :image, 
        styles: { medium: "600x200>", thumb: "300x200>" }, 
        default_url: "https://s-media-cache-ak0.pinimg.com/564x/6c/28/c1/6c28c1644b26303b67cd2879355e8d0a.jpg"

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    belongs_to :company
end
