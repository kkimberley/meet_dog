class PostApi < Grape::API
    resources :posts do
        desc 'Get all posts'
        get do
            posts = Post.all
        end

        desc 'Create a post'
        params do
          optional :post, type: Hash do
            optional :name, type: String
          end
        end
        post do
          @post = Post.new(params[:post])
  
          if @post.save
            if params[:photos] != nil
              params[:photos]['avatar'].each do |p|
                @photo = @post.photos.create(avatar: p)
              end
            end
            redirect '/posts'
          else
          end
        end

        desc 'Add like number'
        post ':id/add_like' do
          post = Post.find_by_id(params[:id])
          post.increment(:like, by = 1)
          if post.save
            post.like
          else
            status 400
            post.errors
          end
        end
    end
end