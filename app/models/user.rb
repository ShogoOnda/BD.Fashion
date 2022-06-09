class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inners, dependent: :destroy
  has_many :outers, dependent: :destroy
  has_many :bottoms, dependent: :destroy
  has_many :shoes, dependent: :destroy
  has_many :onedays, dependent: :destroy

end
