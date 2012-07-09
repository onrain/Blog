class Admin < ActiveRecord::Base
  attr_accessible :article_content, :article_description, :data_create, :published, :title, :image
  
  has_attached_file :image,
    :styles => {
      :small => {:geometry => "50x50>"}, 
      :medium => {:geometry => "250x250>"},
      :hard => {:geometry => "300x300>"} 
      }
end