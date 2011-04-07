class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorize_user, :only => [:destroy]
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  
  private
    def authorize_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user = current_user?(@micropost.user)
    end
end