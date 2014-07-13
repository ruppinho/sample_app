class MicropostsController < ApplicationController
  before_action :require_signed_in_user!, only: [:create, :destroy]

  def index
  end

  def create
  end

  def destroy
  end
end