class Post < ActiveRecord::Base
  has_many :comments, :dependent=>:destroy
  attr_accessible :article_content, :article_description, :date_create, :published, :title, :image
  validates :title, :presence=>true, :length=>{:minimum=>3, :maximum=>150}
  has_attached_file :image,
    :styles => {
      :small => {:geometry => "70x70>"}, 
      :medium => {:geometry => "250x250>"},
      :hard => {:geometry => "500x500>"} 
      },
  :url => "/system/:class/:attachment/:id/:style_:basename.:extension"

  validates_attachment_size :image, :less_than => 1.megabytes  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png','image/jpg']
  
  
  scope :published, where(published:1)
  scope :nopublished, where(published:0)
  scope :ordering, lambda{|f| order("#{f} desc") unless f.nil? }
  scope :search, lambda{ |q|
    q = "%" + q + "%"
    find(:all, :conditions => ['title LIKE ? OR article_content LIKE ? OR article_description LIKE ?', q, q, q])   
  }
  
end