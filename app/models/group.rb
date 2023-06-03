class Group < ApplicationRecord
  has_one_attached :group_image
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true

  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end

  def is_owned_by?(user)
    owner_id == user.id
  end

end
