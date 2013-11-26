class AllocationsController < ApplicationController 
  before_filter :load_software, only: [:create]

	def create 
    @user = User.where(emp_id: params[:allocation][:user_id]).first_or_create
    @allocation = @software.allocations.build(user: @user, allocator: @current_user)
    @allocation.save!
    render json: @allocation
  end

  private
  def load_software
		@software = Software.find(params[:software_id])
  end
end
