class ItemsController < ApplicationController
  before_filter :find_list
  
  # GET /items
  # GET /items.json
  def index
    redirect_to @list
  end

  # GET /items/1
  # GET /items/1.json
  def show
    redirect_to @list
  end

  # GET /items/new
  # GET /items/new.json
  def new
    redirect_to @list
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.list = @list

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item.list, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render "lists/show" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item.list, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @list, notice: 'Item was successfully removed.' }
      format.json { head :ok }
    end
  end
  
  private
  
  def find_list
    @list = List.find(params[:list_id])
  end
end
