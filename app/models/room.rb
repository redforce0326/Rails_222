class Room < ApplicationRecord
  belongs_to :user
  has_one :reservation
  has_one_attached :image
  def set_time
    created_at.strftime("%Y年%m月%d日%H時%M分")
  end
  
  def self.area_seach(search)
      if search
        Room.where(['address LIKE ?', "%#{search}%"])
      else
        Room.all
      end
  end
  def self.keyword_search(search)
      if search
        Room.where(['address ? OR name LIKE ?', "%#{search}%","%#{search}%"])
      else
        Room.all
      end
  end
  
end
