class PublicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.profile.present? 
      @profile = current_user.profile
      @publications = current_user.profile.publications.all
    else 
      redirect_to root_url
    end
  end

  def new
    if current_user.profile.present? 
      @profile = current_user.profile
      @publication = Publication.new
    else
      redirect_to root_url
    end
  end

  def create
    @publication = current_user.profile.publications.build(publication_params)
    if @publication.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    if current_user.profile.publications.find(params[:id]).present?
      @profile = current_user.profile
      @publication = @profile.publications.find(params[:id])
    else 
      redirect_to root_url
    end
  end

  def update
    @publication = current_user.profile.publications.find(params[:id])
    if @publication.update(publication_params)
      flash[:success] = "Publication updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    if @publication.destroy
      flash.notice = "Publication destroyed!"
      redirect_to root_url
    else 
      render 'edit'
    end
  end

  private

  def publication_params
    params.require(:publication).permit(:subtitle, :image)
  end
end
