class ItemsController < ApplicationController

  before_action :require_login, except: [:index, :show]

   before_filter :validate_user, :only => [:edit, :update, :destroy]


  # GET /items
  def index
    if params[:query].present?
      # @items = Item.search(params[:query], page: params[:page])
      @items = Item.search(params[:query])
    else
      @items = Item.all.order("id DESC")
        # @user = User.find(params[:id])
      params[:items][:user_id] =  @user
    # @user = Item.find_by_id(params[:user_id]
    end
  end

  def search_params
    params.permit :page, :per_page, :sort_attribute, :sort_order, :location
  end

  # GET /items/1
  def show
    @items = Item.all
    @item = Item.find(params[:id])
    # @useritems = @user.items.find(params[:id])
    @offeredbyid = @item.user_id
    @offeredby = User.find(@offeredbyid)
    @image = @item.image_url
    @user = current_user
    params[:item][:user_id] = @user.id  
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
    params[:item][:user_id] =  current_user.id
    # @user = User.find(params[:id])

    @item = Item.create(item_params)

    redirect_to "/items/#{@item.id}"
  end


  def edit 
    @item_update = Item.find(params[:id])
    render "/items/edit"
  end

  # PATCH/PUT /items/1
  def update
    @item_update = Item.find(params[:id])
    item_params = params.require(:item).permit(:title, :description, :price, :availability, :image_url)
    if @item_update.update_attributes(item_params)
      flash[:success] = "Item updated successfully!"
      item = Item.find(params[:id])
      redirect_to "/items/#{item.id}"
    end
  end

  # DELETE /items/1
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to "/items"
  end

  def borrow
    @item = Item.find(params[:id])
    @items = Item.all
    @offeredbyid = @item.user_id
    @offeredby = User.find(@offeredbyid)
    @image = @item.image_url
    @user = current_user
    params[:item][:user_id] = @user.id 
    render :borrow 
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :price, :availability, :user_id, :image_url)
    end

    
    def validate_user
      redirect_to root_path unless current_user.id.to_s == params[:id]
    end


end