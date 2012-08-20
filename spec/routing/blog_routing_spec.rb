require 'spec_helper'

describe PostsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/posts" }.should route_to(:controller => "posts", :action => "index")
    end

    it "recognizes and generates #create" do
      { :post => "/posts" }.should route_to(:controller => "posts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/posts/1" }.should route_to(:controller => "posts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/posts/1" }.should route_to(:controller => "posts", :action => "destroy", :id => "1")
    end

     it "recognizes and generates #edit comment" do
      { :get => "/posts/edit/comment/1" }.should route_to(:controller => "posts", :action => "edit_comment", :id => "1")
    end

    it "recognizes and generates #update comment" do
      { :get => "/posts/update/comment/1" }.should route_to(:controller => "posts", :action => "update_comment", :id => "1")
    end

    it "recognizes and generates #search" do
      { :get => "/posts/search" }.should route_to(:controller => "posts", :action => "search")
    end

  end
end

describe CommentsController do
  describe "routing" do
     it "recognizes and generates home#search" do
      { :get => "/search" }.should route_to(:controller => "comments", :action => "search")
    end
 end
end
