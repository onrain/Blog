require 'spec_helper'

describe Admin do
  before(:all) do
    new_admin = {
    :article_content=>"test content",
    :article_description=>"test description",
    :data_create=>Time.now,
    :published=>"1",
    :title=>"test title"
    }
    @admin = Admin.create(new_admin)
    @admin.save
  end
  it "should be able to create a new admin" do
    puts @admin.errors.inspect
    @admin.should be_valid
  end
  it "should be shorter than 150 characters" do
    @admin.update_attributes({:title => 'a'*160})
    @admin.should_not be_valid
    @admin.errors[:title].should include("is too long (maximum is 150 characters)")
    
    @admin.title = 'a' * 130
    @admin.should be_valid
  end
  
 
  after(:all) do
    @admin.delete
  end
end
