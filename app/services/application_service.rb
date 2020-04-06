class ApplicationService
  def self.call(*args, **options)
    new(*args, **options).call
  end
end
