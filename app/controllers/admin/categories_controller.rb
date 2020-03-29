# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new; end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:notice] = 'Create category success'
      redirect_to root_path
    else
      flash[:warning] = 'Create category failed'
      render :new
    end
  end

  # strong params
  private

  def category_params
    params.require(:category).permit :name
  end
end
