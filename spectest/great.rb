class Hello
  def say
    "Hello word"
  end
end


describe "Hello" do
  it "should say 'Hello word' when it the say() message" do
    hello = Hello.new
    ithello = hello.say
    ithello.should == "Hello word"
  end
end
