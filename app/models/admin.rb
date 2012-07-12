class Admin < ActiveRecord::Base
  attr_accessible :article_content, :article_description, :data_create, :published, :title, :image
  validates :title, :presence=>true, :length=>{:minimum=>3}
  before_create :image?

  has_attached_file :image,
    :styles => {
      :small => {:geometry => "70x70>"}, 
      :medium => {:geometry => "250x250>"},
      :hard => {:geometry => "300x300>"} 
      }
  
  def image?
    !(image_content_type =~ /^image.*/).nil?
  end
end