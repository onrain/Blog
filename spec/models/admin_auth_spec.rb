require 'spec_helper'

describe "admin authenticate", :type => :request do
  self.use_transactional_fixtures = false

  it "should be login to admin panel" do
    visit '/admin_auths/sign_in'
    admin = FactoryGirl.build(:admin_auth)
    
    fill_in "Email",                 :with => admin.email
    fill_in "Password",              :with => admin.encrypted_password

    click_button "Sign in"
    
  end
 
end
