class DocumentUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def store_dir
  #   'public/my/upload/directory'
  # end

  def extension_allowlist
    %w[jpg png pdf docx]
  end
end
