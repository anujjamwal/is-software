class DownloadsController < ApplicationController
  after_action :log_download, if: :success?
  
  def show
    @allocation = Allocation.find_by_hash_code(params[:id])
    render :not_found and return unless @allocation && @allocation.alive?(@current_user)

    @software = @allocation.software    
    send_file @software.path, buffer_size: 4096, stream: true, type: 'application/octet-stream'
    @success = true
  end
  
  private 
  def log_download
    @software.download_count += 1
    @download = @current_user.downloads.build(allocation: @allocation, software: @software, ip: request.remote_ip, user_agent: request.user_agent)

    ActiveRecord::Base.transaction do
      @software.save!
      @download.save!
    end
  end  
  
  def success?
    @success
  end
end
