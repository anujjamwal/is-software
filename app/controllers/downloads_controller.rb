class DownloadsController < ApplicationController
  def show
    allocation = Allocation.find_by_hash_code(params[:id])
    render :not_found and return unless allocation && allocation.alive?(@current_user)

    software = allocation.software
    
    software.download_count += 1
    allocation.download_count += 1

    ActiveRecord::Base.transaction do
      software.save!
      allocation.save!
    end
    
    send_file software.path
  end
end
