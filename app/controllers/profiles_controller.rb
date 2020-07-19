class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :toggle_profile]
  
  def new
    @profile = Profile.new
    # 4.times { @profile.multipliers.build }
    # count =0
    # 3.times do |time|
    #   count += 1
    #   @profile.multipliers.build(quantity: count)
    # end
    # @profile.multipliers.build(quantity: 5)
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def toggle_profile
    @profile = Profile.find(params[:id])
    result = @profile.update(is_published: params[:is_published])
    render json: { profile: @profile, result: result }
  end

  private

  def profile_params
    params.require(:profile).permit(:fullname, :occupation, :biography, :coffee_price, :currency_sign, :avatar, multipliers_attributes: [:quantity])
  end
end