FactoryGirl.define do
  factory :post do
     article_content "article_content \n"
     article_description "article_description \n"
     date_create Time.now
     published "1"
     title "title"*3
     image_file_name "duck_web.jpg"
     image_content_type "image/jpeg"
     image_file_size "18882"
  end
end


