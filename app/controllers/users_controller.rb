class UsersController < ApplicationController
  def new
  end

  def create
    import_result = UsersImport.new(params[:seed])
    redirect_to users_path, notice: "#{import_result.success} registros inseridos - #{import_result.failure} falha(s)"
  end

  def index
    @users = User.search(params[:query]).page(params[:page]).per(12)
  end
end
