# encoding: utf-8

class SubscribeMailer < ActionMailer::Base
  default from:"prostirchas@gmail.com"
  
  
  def new_subscribe(emailaddress)
    mail(to:"prostirchas@gmail.com", subject:"New Subscribes")
  end
  
  def websitenews(users)
    @article = Post.limit(5)
    for u in users
      mail(to:"#{u.email}", subject:"Новости за #{Time.now.strftime('%B %d, %Y')}")
    end
  end
end
