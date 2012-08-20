require 'spec_helper'

describe Post do
  
  before(:each) do
    FactoryGirl.build(:post)
  end


  it "should be able to create a new post" do
   FactoryGirl.attributes_for(:post).size.should_not eq(0)
  end
   
  it "should be shorter than 150 characters not be valid" do
    FactoryGirl.build(:post, :title => 'a'*160).should_not be_valid

    FactoryGirl.build(:post, :title=>'a'*150).should be_valid
  end

  
  it "should not be valid image field" do
     FactoryGirl.build(:post, :image_content_type => "image/gif").should_not be_valid

     FactoryGirl.build(:post, :image_content_type => "image/jpg").should be_valid
  end

  it "should not be valid image size" do
     FactoryGirl.build(:post, :image_file_size => 2**20).should_not be_valid

     FactoryGirl.build(:post, :image_file_size => "5000").should be_valid
  end

   it "should create new title" do
    
    auth = FactoryGirl.build(:admin_auth)
    if auth.authentication_token.should eq("dsfg3254$ar$qcc")
    
      Post.create(title:"new title").should have(:no).errors_on(:title)

      post = Post.where(title:"new title")
      for p in post
        p.title.should eq("new title")
      end
    end
  end

  it "should be delete post" do
    auth = FactoryGirl.build(:admin_auth)
    if auth.authentication_token.should eq("dsfg3254$ar$qcc")
      post = Post.where(title:"new title")
      post.delete_all
      post.should be_empty
    end
  end

 
end
