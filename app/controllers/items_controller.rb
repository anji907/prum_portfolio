class ItemsController < ApplicationController
  before_action :logged_in_user

  def index
    @months_options = [
      ["#{Date.today.month}月", Date.today.month],
      ["#{Date.today.months_ago(1).month}月", Date.today.months_ago(1).month],
      ["#{Date.today.months_ago(2).month}月", Date.today.months_ago(2).month]
    ]

    case params[:selected_value]
    when Time.current.month.to_s
      @items = current_user.learning_data(Time.current)
    when Time.current.months_ago(1).month.to_s
      @items = current_user.learning_data(Time.current.months_ago(1))
    when Time.current.months_ago(2).month.to_s
      @items = current_user.learning_data(Time.current.months_ago(2))
    else
      @items = current_user.learning_data(Time.current)
    end
  end

  def new
    category = Category.find(params[:category_id])
    @item = category.items.build 
  end

  def create
    @item = Item.create!(item_params)
    message = "#{@item.category.name}に#{@item.name}を\n#{@item.learning_time}分で追加しました！"
    redirect_to items_path, flash: { success: message }, status: :found
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to items_path, flash: { success: "#{@item.name}の学習時間を保存しました" }, status: :found
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:success] = "#{item.name}を削除しました!"
    redirect_to items_path, status: :see_other
  end

  private

    def item_params
      params.require(:item).permit(:name, :learning_time, :category_id).merge(user_id: current_user.id)
    end
end
