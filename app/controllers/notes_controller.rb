class NotesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @note = @post.notes.new(note_params)
    @note.user = current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to @post, notice: 'Comment was created successfully.'}
        format.json { render :show, status: :created, location: @post}
        format.js
      else
        format.html {redirect_to @post, alert: 'Comment was not saved successfully.'}
        format.json { render json: @note.errors, status: :unprocessable_entity}
      end
    end 
  end

  def destroy
    @note = Note.find(params[:id])
    post = @note.post
    @note.destroy
    redirect_to post
  end

private

  def note_params
    params.require(:note).permit(:user_id, :body)
  end

end
