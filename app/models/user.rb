class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outers, dependent: :destroy
  has_many :inners, dependent: :destroy
  has_many :bottoms, dependent: :destroy
  has_many :shoes, dependent: :destroy
  has_many :outercomments, dependent: :destroy  #追加
  has_many :innercomments, dependent: :destroy  #追加
  has_many :bottomcomments, dependent: :destroy  #追加
  has_many :shoecomments, dependent: :destroy  #追加

end
