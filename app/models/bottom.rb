class Bottom < ApplicationRecord
  has_one_attached :bottomImage
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags#, dependent: :destroy
  has_many :bottomcomments, dependent: :destroy  #追加

  enum status: { private: 0, public: 1 }, _prefix: true

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
      current_tags = self.tags.pluck(:name) unless self.tags.nil?
      # 現在取得したタグから送られてきたタグを除いてoldtagとする
      old_tags = current_tags - sent_tags
      # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
      new_tags = sent_tags - current_tags

      # 古いタグを消す
      old_tags.each do |old|
        self.tags.delete　Tag.find_by(name: old)
      end

      # 新しいタグを保存
      new_tags.each do |new|
         Tag.find_or_create_by(name: new)
      end
  end

end
