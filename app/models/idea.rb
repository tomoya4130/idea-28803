class Idea < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :likes, dependent: :destroy
  
  #いいねしているかの確認
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
  
  has_one_attached :image

  belongs_to_active_hash :genre

  #空の投稿を保存できないようにする
  validates :title, :content, :genre, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, numericality: { other_than: 1 } 
end
