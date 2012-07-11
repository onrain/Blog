class Admin < ActiveRecord::Base
  attr_accessible :article_content, :article_description, :data_create, :published, :title, :image
  validates :article_content, :article_description, :title, :presence=>true
  validates :title, :length=>{:minimum=>3}
  validates :image, :allow_blank=>true, :format=>{
  :with=>%r{\.(gif|jpg|png)$}i,
  :message=> 'must be a URL for GIF or PNG or JPG'
  } 
  has_attached_file :image,
    :styles => {
      :small => {:geometry => "50x50>"}, 
      :medium => {:geometry => "250x250>"},
      :hard => {:geometry => "300x300>"} 
      }
end