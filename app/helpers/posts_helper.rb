module PostsHelper
    class << self
        def create(post_params, user)
            puts post_params
            puts "mego    " +user.name
            post = Post.new(post_params)
            post.user_id = user.id
            if post.save!
                BlogWorker.perform_async(KafkaHelper.create_log("Post","create",user['id'],post.id),post.id) 
                post
            else
                post.errors
            end
        end
        
    end
end