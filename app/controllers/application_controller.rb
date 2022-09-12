class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # configure do
  #   set :public_folder, 'public'
  #   #set :views, 'app/views'
  #   set :default_content_type, :json
  #    set :session_secret, ENV["SESSION_SECRET"]
  # end

  # error ActiveRecord::RecordNotFound do
  #   {errors: "Record not found with id #{params['id']}"}.to_json
  # end


      # GET: /comments
      get "/comments" do
        Comment.all.to_json
      end
    
    
      # POST: /comments
      post "/comments" do
        comment= Comment.create(
          comment: params[:comment],
          game_id: params[:game_id],
          user_id: params[:user_id],
        
        )
        if comment.id
          comment.to_json
        else
          comment.errors.full_messages.to_sentence
          {errors: comment.errors.full_messages.to_sentence}.to_json
        end
      end
    
      # GET: /comments/5
      get "/comments/:id" do
        comment = Comment.find_by(id: params[:id])
       if comment
          comment.to_json(include: [user: {only: [:username, :user]}])
        else
          {errors: "Record not found with id #{params['id']}"}.to_json
        end
      end
    
      # PATCH: /comments/5
      patch "/comments/:id" do
        
      end
    
      # DELETE: /comments/5/delete
      delete "/comments/:id" do
        comment = Comment.find_by(id: params[:id])
        if comment&.destroy
          {messages: "Record successfully destroyed"}.to_json
        else
          {errors: "Record not found with id #{params['id']}"}.to_json
        end
      end
    
      
    
    
    end

      # GET: /games
      get "/games" do
  
        Game.all.to_json(include: :comments )
          
          # return a JSON response with an array of all the game data
      
          # Game.all.to_json(include: [user: {except: [:created_at, :updated_at]}])
        end
      
       # POST: /games
        post "/games" do
          game= Game.create(
            name: params[:name],
            image_url: params[:image_url],
            user_id: params[:user_id]
          )
          if game.id
            game.to_json
          else
            game.errors.full_messages.to_sentence
            {errors: game.errors.full_messages.to_sentence}.to_json
          end
        end
      
        # GET: /games/5
        get "/games/:id" do
          game = Game.find_by(id: params[:id])
         if game
            game.to_json
          else
            {errors: "Record not found with id #{params['id']}"}.to_json
          end
        end
      
         # PATCH: /games/5
        patch "/games/:id" do
          game = Game.find(params[:id])
         if game && game.update(params)
            game.to_json
          elsif !game
            {errors: "Record not found with id #{params['id']}"}.to_json
          else
            {errors: game.errors.full_messages.to_sentence}.to_json
          end
        end
      
        # DELETE: /games/5/delete
        delete "/games/:id" do
          game = Game.find_by(id: params[:id])
          if game&.destroy
            {messages: "Record successfully destroyed"}.to_json
          else
            {errors: "Record not found with id #{params['id']}"}.to_json
          end
        end
      
       
      end
      delete "/users/:id/delete" do
        find_user
        if @user&.destroy
          {messages: "Record successfully destroyed"}.to_json
        else
          {errors: "Record not found with id #{params['id']}"}.to_json
        end
      end
    
      private
    
      def find_user
        @user = User.find_by_id(params["id"])
      end
    
      def serialized_user
        @user.to_json(include: :games)
      end
    end
  
    #POST: /sessions
    post "/login" do
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        
          session[:user_id] = user.id
          

          halt 200, {user: user, message:"User successfully logged in"}.to_json
      else
          halt 404, {error: "Invalid information"}.to_json
      end
  end

  delete "/logout" do
      session.delete("user_id")
  end
end
      

#   get "/me" do 
#     @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
#     if @current_user
#       halt 200, {user: @current_user}.to_json
#     else
#       halt 404, {error: "No one is logged in"}.to_json
#   end
# end

  # private
  # def shared_helper_method
  #   puts"I am visible in every controller!"
  # end

end