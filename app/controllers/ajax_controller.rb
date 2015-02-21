class AjaxController < ApplicationController
  def new
    respond_to do |format|
      format.js do
        render_modal(:new)
      end
    end
  end

  def create
    respond_to do |format|
      format.js do
        @item.save ? render_success(:new, :created) : render_errors
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { head :ok }
    end
  end

  def edit
    respond_to do |format|
      format.js do
        render_modal(:edit)
      end
    end
  end

  def update
    respond_to do |format|
      format.js do
        if @item.update_attributes(item_params)
          render_success(:edit, :ok)
        else
          render_errors
        end
      end
    end
  end

  private

  def render_modal(mode, form='form')
    render("layouts/#{mode}",
           locals: {
             title: t('education.new'),
             form: form
           })
  end

  def render_success(mode, return_code)
    render(partial: "layouts/item_#{mode}",
           locals: {
             item: @item
           },
           layout: false,
           status: return_code)
  end

  def render_errors
    render json: @item.errors,
           status: :unprocessable_entity
  end
end