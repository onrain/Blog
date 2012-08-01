namespace :go do
  task :in_art => :environment do
    
   par = {
     article_content: "article_content \n"*100,
     article_description: "article_description \n"*100,
     date_create: Time.now,
     published: "1",
     title: "title"*3,
     image_file_name:"duck_web.jpg",
     image_content_type:"image/jpeg",
     image_file_size:"18882"
   }
   i=0
   while(i<30) do
     Post.create(par)
     i+=1
   end
   puts "create done!" 
  end

  task :un_art => :environment do
   Post.delete_all
   puts "Destroy done"
  end

  
end
