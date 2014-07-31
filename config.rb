# Set directories
set :css_dir,      'stylesheets'
set :js_dir,       'javascripts'
set :images_dir,   'images'
set :partials_dir, 'partials'

set :debug_assets, true

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload, no_swf: true

  # Deploy to S3
  activate :s3_sync do |options|
    options.bucket = 'fairnessbr.com'
  end

  # Setup Cloudfront for invalidations
  activate :cloudfront do |options|
    options.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    options.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    options.distribution_id = 'E2AZH2YQ718VOT'
    options.filter = /\.html$/i
  end
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Set asset host
  # Bug - https://github.com/middleman/middleman-sprockets/issues/46
  # activate :asset_host, host: 'http://assets.fairnessbr.com'

  # Enable cache buster
  activate :asset_hash

  # Use GZIP compression
  activate :gzip

  # Compress images
  activate :imageoptim do |options|
    options.pngout_options = false
    options.advpng_options = false
  end
end

helpers do
  def speaker_id(index)
    "speaker-#{index}"
  end

  def comment_id(speaker, comment)
    "comment-s#{speaker}-#{comment}"
  end

  def comment_with_callouts(comment)
    comment.gsub(/(\[[0-9]{2}:[0-9]{2}:[0-9]{2}\])/, '<a href="#">\1</a>')
  end
end
