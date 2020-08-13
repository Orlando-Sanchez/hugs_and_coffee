class MonetaryAccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.profile.present?
      @profile = current_user.profile
      @monetary_accounts = current_user.monetary_accounts.all 
    else
      redirect_to root_url
    end
  end

  def new
    if current_user.profile.present? 
      @profile = current_user.profile
      @monetary_account = MonetaryAccount.new
    else
      redirect_to root_url
    end
  end

  def create
    @monetary_account = current_user.monetary_accounts.build(monetary_account_params)
    if @monetary_account.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    if current_user.monetary_accounts.find(params[:id]).present?
      @profile = current_user.profile
      @monetary_account = current_user.monetary_accounts.find(params[:id])
    else 
      redirect_to root_url
    end
  end

  def update
    @monetary_account = current_user.monetary_accounts.find(params[:id])
    if @monetary_account.update(monetary_account_params)
      flash[:success] = "Account updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @monetary_account = MonetaryAccount.find(params[:id])
    if @monetary_account.destroy
      flash.notice = "Account destroyed!"
      redirect_to root_url
    else 
      render 'edit'
    end
  end

  private

  def monetary_account_params
    params.require(:monetary_account).permit(:entity, :account_email, :identification, :account_kind, :account_number)
  end
end