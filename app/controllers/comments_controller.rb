class CommentsController < ApplicationController

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