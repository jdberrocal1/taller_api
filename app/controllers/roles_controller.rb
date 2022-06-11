class RolesController < ApplicationController

  def index
    result = Role.order(name: :desc)
    render json: { success: true, roles: result }, status: :ok
  end

  def show
    result = Role.where(id: params[:id])
    users = User.where(role_id: params[:id])
    render json: { success: true, role: result, users: users }, status: :ok
  end
end
