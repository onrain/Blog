FactoryGirl.define do
  factory :comment do
       comment_content "Comment content"
       data_p Time.now
       email "test@test.com"
       post_id "1"
       username "Username"
  end
end


