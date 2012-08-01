FactoryGirl.define do
  factory :post do
     article_content "article_content \n"*100,
     article_description "article_description \n"*100,
     date_create Time.now,
     published "1",
     title "title"*3,
     image_file_name "duck_web.jpg",
     image_content_type "image/jpeg",
     image_file_size "18882"
  end
end



FactoryGirl.define do
  factory :comment do
     comment_content "Comment content",
     data_p Time.now,
     email "test@test.com",
     post_id "1",
     username "Username"
     
  end
end



