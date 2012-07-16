require 'spec_helper'

describe Comment do
  before(:all) do
    new_comment = {
    :comment_content=>"test comment",
    :data_p=>Time.now,
    :email=>"test@test.com",
    :post_id=>"1",
    :username=>"John Doe",
    :admin_id=>"1"
    }
    @comment = Comment.create(new_comment)
    @comment.save
    
  end
  it "should be able to create a new comment" do
    puts @comment.errors.inspect
    @comment.should be_valid
  end
  it "should be bigest than 255 characters" do
    @comment.update_attributes({:comment_content => 'a'*256})
    @comment.should_not be_valid
    @comment.errors[:comment_content].should include("is too long (maximum is 255 characters)")
    
    @comment.comment_content = 'aaaa'
    @comment.should be_valid
  end
  
  it "should be email validation" do
    @comment.update_attributes({:email => 'aaaa.com'})
    @comment.should_not be_valid
    
    
    @comment.email = 'test@test.com'
    @comment.should be_valid
  end
  
  after(:all) do
    @comment.delete
  end
end
