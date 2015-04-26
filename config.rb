###
# Compass
###

# Susy grids in Compass
require 'compass'
require 'compass-normalize'
require 'susy'
require 'breakpoint'
require 'kramdown'
require 'font-awesome-sass'


# Change Compass configuration
compass_config do |config|
   config.output_style = :compact
end

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
  activate :minify_css
  activate :minify_html, remove_input_attributes: false

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets


  # Or use a different image path
  # set :http_path, "/Content/images/"
  activate :directory_indexes

  activate :imageoptim


end

#activate :contentful do |f|
#  f.space         = { mdwp:'zlag77iul1ug' }
#  f.access_token  = '40e963dfce9e6bc216d6624cd39c0be5a32bd89e29eee07a1e49a8d30b51bfd6'
#  f.cda_query     = { content_type:'2wKn6yEnZewu2SCCkus4as', include: 1 }
#  f.content_types = { post:'2wKn6yEnZewu2SCCkus4as' }
#end

#activate :contentful do |g|
# g.space         = { mdwp_project:'zlag77iul1ug' }
# g.access_token  = '40e963dfce9e6bc216d6624cd39c0be5a32bd89e29eee07a1e49a8d30b51bfd6'
# g.cda_query     = { content_type:'3yXXZj2Yyk0USyQyka2O0C', include: 1 }
# g.content_types = { project:'3yXXZj2Yyk0USyQyka2O0C' }
#end

#activate :contentful do |h|
#  h.space         = { mdwp_entry:'zlag77iul1ug' }
#  h.access_token  = '40e963dfce9e6bc216d6624cd39c0be5a32bd89e29eee07a1e49a8d30b51bfd6'
#  h.cda_query     = { content_type:'5qHZV696FiIkemEGcm2moe', include: 1 }
#  h.content_types = { entry:'5qHZV696FiIkemEGcm2moe' }
#end


data.mdwp_entry.entry.each do |id, entry|
  # using its data as locals inside the template

  proxy "/#{entry["url"]}.html", "proxy_entries_template.html", :locals => { :entry => entry }, ignore: true
end

data.mdwp_project.project.each do |id, project|
  # using its data as locals inside the template

  proxy "/#{project["url"]}.html", "proxy_projects_template.html", :locals => { :project => project }, ignore: true
end

data.mdwp.post.each do |id, post|
  # using its data as locals inside the template

  proxy "/#{post["slug"]}.html", "proxy_template.html", :locals => { :post => post }, ignore: true
end

page "/404.html", :directory_index => false
page "/301.html", :directory_index => false
page "/google0334405144ab11b4.html", :directory_index => false


set :url_root, 'http://www.mdwp.de'

# disable layout
page "redirects", :layout => false

# rename file after build
after_build do
  File.rename 'build/redirects', 'build/_redirects'
end


set :markdown_engine, :kramdown
set :markdown, :layout_engine => :erb

activate :livereload, :host => '0.0.0.0', :apply_js_live => false, :apply_css_live => false
activate :search_engine_sitemap
