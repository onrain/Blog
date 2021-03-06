require 'spec_helper'

describe Comment do
   before(:each) do
    @comment =  FactoryGirl.build(:comment)  
   end

   it "should be able to create a new comment" do
     FactoryGirl.attributes_for(:comment).size.should_not eq(0)
   end

  it "should be bigest than 255 characters" do
    FactoryGirl.build(:comment, :comment_content => 'a'*256).should_not be_valid

    FactoryGirl.build(:comment, :comment_content => "a"*10).should be_valid
  end
  
  it "should be email validation" do
    FactoryGirl.build(:comment, :email => "aaa.com").should_not be_valid

    FactoryGirl.build(:comment, :email => "test@test.com").should be_valid

    FactoryGirl.build(:comment, :email => "").should_not be_valid
  
    FactoryGirl.build(:comment, :email => "a@a.ru").should be_valid

    FactoryGirl.build(:comment, :email => "aa@"+"a"*100+".com").should_not be_valid
  end
  
  it "should delete comment" do
    
      comm = Comment.create(comment_content:"new comment_content")
      comm.save.should_not be_nil
    
      comm = Comment.where(comment_content:"new comment_content")
      comm.delete_all
      comm.size.should eq(0)

  end

  it "should be edit comment" do
    Comment.create(comment_content:"this is comment!")
    res = Comment.where(comment_content:"this is comment!")
    for r in res
      r.comment_content = "new new comment!"
    end
    for r in res
      r.comment_content.should eq("new new comment!")
    end
  end


end
