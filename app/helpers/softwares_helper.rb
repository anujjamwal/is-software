module SoftwaresHelper
  def software_download_link(software)
    software.download_hash ? download_url(id: software.download_hash) : 'Please contact Admin to request access'
  end
end
