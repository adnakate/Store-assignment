class StoreController < ApplicationController
  def index 
  end

  def create_pen
    pen = Pen.create(pen_params)
    if pen.save
      redirect_to :list
    else
      flash[:alert] = "Cannot create new pen!"
      redirect_to :store
    end
  end

  def create_notebook
    pen = Notebook.create(pen_params)
    if pen.save
      redirect_to :list
    else
      flash[:alert] = "Cannot create new notebook!"
      render :store
    end
  end

  def edit_store_type
    @product = Store.find_by_id(params[:id])
  end

  def update_store
    if Store.find_by_id(params[:id]).update(update_params)
      redirect_to :list
    else
      flash[:notice] = "Cannot update"
      redirect_to :list
    end
  end

  def list
    @products = Store.all 
    @pen_price = Store.price_sum("Pen")
    @notebook_price = Store.price_sum("Notebook")
  end

  private

  def pen_params
    params[:store].permit(:name, :product_price, :color, :status, :inward_date, :description)
  end

  def notebook_params
    params.permit(:name, :product_price, :status, :inward_date, :description)
  end

  def update_params
    params[:store].permit(:name, :product_price, :color, :status, :inward_date, :description)
  end
end
