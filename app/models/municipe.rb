class Municipe < ApplicationRecord
    has_many :adress, foreign_key: "municipe_id"
    mount_uploader :photo, ImageUploader 
end
