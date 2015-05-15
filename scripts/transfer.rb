class Transfer
  require 'net/scp'
  require 'fileutils'

  @@file_name
  @@file_size
  @@file_type
  @@transfer_step = ["start", "finish", "error"]
  @@compress_status = ["start", "finish", "error"]


  def self.compress(file_path)

  end

  def self.transfer_type(file_type)
  end

  def self.transfer_finish?

  def server_access(host, username, port, password)

  end

  def upload(object_to_upload_instance, local_path=[], remotes_path=[])

  end

  private



end