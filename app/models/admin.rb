class Admin < ActiveRecord::Base
  attr_accessible :article_content, :article_description, :data_create, :published, :title, :image
  validates :article_content, :article_description, :title, :presence=>true
  validates :title, :length=>{:minimum=>3}
  before_create :image?
  before_destroy :get_count

  has_attached_file :image,
    :styles => {
      :small => {:geometry => "50x50>"}, 
      :medium => {:geometry => "250x250>"},
      :hard => {:geometry => "300x300>"} 
      }
  
  def image?
    !(image_content_type =~ /^image.*/).nil?
  end
  
  def get_count
    if Admin.count.empty?
      
    end
  end
end