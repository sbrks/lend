class ItemsController < ApplicationController
  # before_action :set_item, except: [:index, :show] 
  # only: [:show, :edit, :update, :destroy]

  before_action :require_login, except: [:index, :show, :new]


  # GET /items
  # GET /items.json
  def index
    if params[:query].present?
      # @items = Item.search(params[:query], page: params[:page])
      @items = Item.search(params[:query])
    else
      @items = Item.all
        # @user = User.find(params[:id])
      params[:items][:user_id] =  @user
    # @user = Item.find_by_id(params[:user_id]
    end
  end

  def search_params
    params.permit :page, :per_page, :sort_attribute, :sort_order, :location
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @user = current_user
    params[:item][:user_id] = @user.id

    # @user = User.find(params[:id]
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    params[:items][:user_id] =  current_user.id
    # @user = User.find(params[:id])

    @item = Item.create(item_params)

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
    item_params = params.require(:item).permit(:title, :description, :price, :availability)
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
      params.require(:item).permit(:title, :description, :price, :availability, :user_id)
    end

end