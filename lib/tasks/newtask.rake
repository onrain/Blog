namespace :go do
  task :new_art => :environment do
    
   par = {
     article_content: "article_content \n"*100,
     article_description: "article_description \n"*100,
     date_create: Time.now,
     published: "1",
     title: "title"*3
   }
   i=0
   while(i<30) do
     Post.create(par)
     i+=1
   end
   puts "create done!" 
  end

  task :destroy_art => :environment do
   i=0
   while i<30 do
     Post.delete(:last)
     i+=1
   end 
   puts "Destroy done"
  end

  
end
