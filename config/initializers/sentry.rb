Sentry.init do |config|
  config.dsn = "https://e086b0d3d7d803b654ecbc1ab633cc98@o4507610319618048.ingest.de.sentry.io/4508732040282192" # Replace with your actual DSN from Sentry.io
  config.breadcrumbs_logger = [ :active_support_logger, :http_logger ]

  # Enable performance monitoring
  config.traces_sample_rate = 1.0 # Adjust this value (0.0 to 1.0) for sampling rate

  # Set the environment (optional but recommended)
  config.environment = Rails.env
end
