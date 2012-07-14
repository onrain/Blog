class Admin < ActiveRecord::Base
  has_many :comments, :dependent=>:destroy
  attr_accessible :article_content, :article_description, :data_create, :published, :title, :image
  validates :title, :presence=>true, :length=>{:minimum=>3}
  has_attached_file :image,
    :styles => {
      :small => {:geometry => "70x70>"}, 
      :medium => {:geometry => "250x250>"},
      :hard => {:geometry => "300x300>"} 
      }

  validates_attachment_size :image, :less_than => 1.megabytes  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png','image/jpg']  
end