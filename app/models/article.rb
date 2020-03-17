class Article < ApplicationRecord
  has_one_attached :clip
  has_many_attached :images
  #has_rich_text :content
  belongs_to :user
  has_many :replies, dependent: :destroy
  #belongs_to :author, class_name: 'User'
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: false
  # validates :descriptionvideo, presence: true
  # validates :descriptionimages, presence: false
  validates :clip, presence: false
  validates :user_id, presence: true

  def thumbnail input
    return self.images[input].variant(resize: '200x200!').processed
  end
#
# # with_attached_images :images, :default_url => ""
# validates_attachment_content_type :images, :content_type => /\Aimage\/.*\z/
#{
#  :medium => {:geometry => "640x480", :format => 'mp4'},
#  :thumbnail => {:geometry => "100x50", :format => 'jpg', :time => 10}
#}
#validates_acceptance_of :clip, content_type: /\Amovie\/.*\z/

end
