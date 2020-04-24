class Employe < ApplicationRecord

belongs_to :city
has_many :subordinates, class_name: "Employe",foreign_key: "manager_id"
belongs_to :manager, class_name: "Employe", optional: true
  mount_uploader :image, AvatarUploader

validate :validate_relocate, on: :create
#validates_presence_of :state, :granted_at, :if => :valid_type? 
  
def validate_relocate

#puts self.willing_to_relocate
#post_exists = Post.where(author: 'tom').where(subject: 'Rails is awesome').exists?
  if self.willing_to_relocate == true
    self.errors.add(:willing_to_relocate, "New joinee does not have the option for relocation")
    return false
  end
  true
end





end
