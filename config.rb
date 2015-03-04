###
# Compass
###

# Susy grids in Compass
require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page command
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end

end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

#activate :contentful do |f|
#  f.space         = { mdwp:'zlag77iul1ug' }
#  f.access_token  = '40e963dfce9e6bc216d6624cd39c0be5a32bd89e29eee07a1e49a8d30b51bfd6'
#  f.cda_query     = { content_type:'2wKn6yEnZewu2SCCkus4as', include: 1 }
#  f.content_types = { post:'2wKn6yEnZewu2SCCkus4as' }
#end
