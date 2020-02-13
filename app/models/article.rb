class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :replies, dependent: :destroy
  #belongs_to :author, class_name: 'User'
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 2000}
  validates :clip, presence: true
  validates :clip, presence: true
  validates :user_id, presence: true

#for video
has_one_attached :clip
has_one_attached :thumbnail


#has_attached_thumbnail :thumbnail, :default_url => ""
#validates_attachment_content_type :thumbnail, :content_type => /\Athumbnail\/.*\z/
#{
#  :medium => {:geometry => "640x480", :format => 'mp4'},
#  :thumbnail => {:geometry => "100x50", :format => 'jpg', :time => 10}
#}
#validates_acceptance_of :clip, content_type: /\Amovie\/.*\z/

end
