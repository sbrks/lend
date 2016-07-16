class ItemsController < ApplicationController
  # before_action :set_item, except: [:index, :show] 
  # only: [:show, :edit, :update, :destroy]

  before_action :require_login, except: [:index, :show]



  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @user = User.find(2)

    # @user = Item.find(params[:user_id].items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @user = User.find(2)
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    params[:items][:user_id] = current_user.id

    # item = Item.find(params[:id])

    item_params = params.require(:item).permit(:title, :description, :user_id)

    Item.create(item_params)

    redirect_to "/items/#{@item.id}"
  end

  def edit 
    @item_update = Item.find(params[:id])
    render "/items/edit"
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item_update = Item.find(params[:id])
    item_params = params.require(:item).permit(:title, :description)
    if @item_update.update_attributes(item_params)
      flash[:success] = "Item updated successfully!"

      item = Item.find(params[:id])
      redirect_to "/items/#{item.id}"
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to "/items"

  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description)
    end

end