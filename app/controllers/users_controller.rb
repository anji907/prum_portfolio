class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]= "こんにちは#{@user}さん！"
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def profile
    @user = current_user

    @backend_2months_ago = Item.where(
                                created_at: Time.current.months_ago(2).beginning_of_month..Time.current.months_ago(2).end_of_month,
                                category_id: 1, user_id: current_user.id).pluck(:learning_time).sum
    @backend_last_month = Item.where(
                                created_at: Time.current.months_ago(1).beginning_of_month..Time.current.months_ago(1).end_of_month,
                                category_id: 1, user_id: current_user.id).pluck(:learning_time).sum
    @backend_this_month = Item.where(
                                created_at: Time.current.beginning_of_month..Time.current.end_of_month,
                                category_id: 1, user_id: current_user.id).pluck(:learning_time).sum

    @frontend_2months_ago = Item.where(
                                created_at: Time.current.months_ago(2).beginning_of_month..Time.current.months_ago(2).end_of_month,
                                category_id: 2, user_id: current_user.id).pluck(:learning_time).sum
    @frontend_last_month = Item.where(
                                created_at: Time.current.months_ago(1).beginning_of_month..Time.current.months_ago(1).end_of_month,
                                category_id: 2, user_id: current_user.id).pluck(:learning_time).sum
    @frontend_this_month = Item.where(
                                created_at: Time.current.beginning_of_month..Time.current.end_of_month,
                                category_id: 2, user_id: current_user.id).pluck(:learning_time).sum

    @infra_2months_ago = Item.where(
                                created_at: Time.current.months_ago(2).beginning_of_month..Time.current.months_ago(2).end_of_month,
                                category_id: 3, user_id: current_user.id).pluck(:learning_time).sum
    @infra_last_month = Item.where(
                                created_at: Time.current.months_ago(1).beginning_of_month..Time.current.months_ago(1).end_of_month,
                                category_id: 3, user_id: current_user.id).pluck(:learning_time).sum
    @infra_this_month = Item.where(
                                created_at: Time.current.beginning_of_month..Time.current.end_of_month,
                                category_id: 3, user_id: current_user.id).pluck(:learning_time).sum
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :bio, :avatar)
  end
end
