class Ticket < ActiveRecord::Base
  belongs_to :user
  delegate :image_url, :nickname, to: :user, prefix: true

  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true
end
