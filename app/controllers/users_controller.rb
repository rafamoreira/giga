class UsersController < ApplicationController
  def new
  end

  def create
    import_result = UsersImport.new(params["import_users"]["seed"])
    redirect_to root_path, notice: "#{import_result.success} registros inseridos - #{import_result.failure} falha(s)"
  end
end
