class AttachmentsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
 respond_to :html, :json
  def index
  end

  def new 
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attach_params)
    @attachment.user_id = current_user.id
    if @attachment.save
      redirect_to @attachment
    else
      render 'new'
    end

  end

  def show
    @attachment = Attachment.find(params[:id])
    @user = User.find_by id: @attachment.user_id


  end
  private

  def attach_params
    params.require(:attachment).permit(:title, :description, :file, :user_id)
  end
end
