require 'spec_helper'

describe Comment do
   before(:each) do
    @comment =  Factory(:comment)  
   end

   it "should be able to create a new comment" do
    puts @comment.errors.inspect
    @comment.should be_valid
  end

  it "should be bigest than 255 characters" do
    Factory.build(:comment, :comment_content => 'a'*256).should_not be_valid

    #Factory.build(:comment_content => "a"*10).should be_valid
  end
  
  it "should be email validation" do
    Factory.build(:comment, :email => "aaa.com").should_not be_valid

    Factory.build(:comment, :email => "test@test.com").should be_valid

    Factory.build(:comment, :email => "").should_not be_valid
  
    Factory.build(:comment, :email => "a@a.ru").should be_valid

    Factory.build(:comment, :email => "aa@"+"a"*100+".com").should_not be_valid
  end

  
end
