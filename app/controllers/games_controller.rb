# class GamesController < ApplicationController

#     # GET: /games
#     get "/games" do
  
#     Game.all.to_json(include: :comments )
      
#       # return a JSON response with an array of all the game data
  
#       # Game.all.to_json(include: [user: {except: [:created_at, :updated_at]}])
#     end
  
#    # POST: /games
#     post "/games" do
#       game= Game.create(
#         name: params[:name],
#         image_url: params[:image_url],
#         user_id: params[:user_id]
#       )
#       if game.id
#         game.to_json
#       else
#         game.errors.full_messages.to_sentence
#         {errors: game.errors.full_messages.to_sentence}.to_json
#       end
#     end
  
#     # GET: /games/5
#     get "/games/:id" do
#       game = Game.find_by(id: params[:id])
#      if game
#         game.to_json
#       else
#         {errors: "Record not found with id #{params['id']}"}.to_json
#       end
#     end
  
#      # PATCH: /games/5
#     patch "/games/:id" do
#       game = Game.find(params[:id])
#      if game && game.update(params)
#         game.to_json
#       elsif !game
#         {errors: "Record not found with id #{params['id']}"}.to_json
#       else
#         {errors: game.errors.full_messages.to_sentence}.to_json
#       end
#     end
  
#     # DELETE: /games/5/delete
#     delete "/games/:id" do
#       game = Game.find_by(id: params[:id])
#       if game&.destroy
#         {messages: "Record successfully destroyed"}.to_json
#       else
#         {errors: "Record not found with id #{params['id']}"}.to_json
#       end
#     end
  
   
#   end