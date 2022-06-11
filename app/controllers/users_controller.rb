class UsersController < ApplicationController

  def index
    result = User.order(lname: :desc).limit(100)
    render json: { success: true, users: result }, status: :ok
  end

  def show
    result = User.where(id: params[:id])

    render json: { success: true, user: result }, status: :ok
  end

  def create
    fname, lname, state, city, address, rol_id = create_user_params
    user = User.new({fname: fname, lname: lname, state: state, city: city, address: address, dni: params[:dni], rol_id: rol_id})

    if user.save
      render json: { success: true, user: user }, status: :ok
    else
      error = StandardError.new("Error creating user note: #{user.errors.messages}")
      NewRelic::Agent.notice_error(error)
      render json: { success: false, message: user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def create_user_params
    params.require([:fname, :lname, :state, :city, :address, :rol_id])
  end
end
