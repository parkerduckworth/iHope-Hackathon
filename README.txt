<<<>>>DOCUMENTATION<<<>>>

Ruby 2.4.0
Rails 5.1.4
Homebrew 1.3.4

<<<>>>CREATE APP & DATABASE<<<>>>

CLI: rails new bindler --database=postgresql
CLI: cd bindler
CLI: psql postgres
CLI: CREATE DATABASE bindlerapp;
CLI: \q

change config/database.yml ->
	in development:, test:, and production:,
		change name of database: ->
			bindlerapp

~git commit~





<<<>>>ADD BOOTSTRAP<<<>>>

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'

change extension of application.css -> .scss

add to app/assets/stylesheets/application.scss, below comment block ->
	@import "bootstrap-sprockets";
	@import "bootstrap";

	.field_with_errors { @extend .has-error; }
	.alert-notice { @extend .alert-info; }
	.alert-alert { @extend .alert-danger; }

change config/environments/production.rb ->
	config.assets.compile = true

add to app/assets/javascripts/application.js above existing requires ->
	//= require jquery
	//= require bootstrap-sprockets

~git commit~





<<<>>>ADD ACTIVEADMIN<<<>>>

add to Gemfile -> gem 'activeadmin', '~> 1.1'

CLI: bundle
CLI: gem install activeadmin
CLI: rails g active_admin:install
CLI: rake db:migrate
CLI: rake db:seed

~git commit~





<<<>>>ADD DEVISE<<<>>>

add to gemfile -> gem 'devise', '~> 4.3'

CLI: bundle
CLI: rails generate devise:install

add to config/environments/development.rb ->
	config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

add to app/controllers/application_controller ->
    def after_sign_in_path_for(resource)
    creators_path
    end

add to app/views/layouts/_flash_messages.html.erb. ->
	<% flash.each do |key, value| %>
		<div class="alert alert-<%= key %> alert-dismissable">
		  <button type="button" class="close" data-dismiss="alert"
		     aria-hidden="true">×</button>
		  <%= value %>
		</div>
	<% end %>

add to app/views/layouts/application.html.erb, in body, above yield tag ->
	<%= render 'layouts/flash_messages' %>

CLI: rails g devise Creator
CLI: rails g devise:views creators
CLI: rake db:migrate

~git commit~





<<<>>>ADD CUSTOM FIELDS TO DEVISE<<<>>>

CLI: rails g migration AddNameToCreators name:string

add to ##############_add_name_to_creators.rb, under :name column ->
    add_column :creators, :blurb, :string
    add_column :creators, :bio, :string

CLI: rake db:migrate

add to app/views/creators/registrations/edit.html.erb ->
    <div class="field">
        <%= f.label :name %><br />
        <%= f.text_field :name, autofocus: true %>
    </div>

    <div class="field">
        <%= f.label :blurb %><br />
        <%= f.text_field :blurb %>
    </div>

    <div class="field">
        <%= f.label :bio %><br />
        <%= f.text_field :bio %>
    </div>

add to app/views/creators/registrations/new.html.erb ->
    <div class="field">
        <%= f.label :name %><br />
        <%= f.text_field :name, autofocus: true %>
    </div>

    <div class="field">
        <%= f.label :blurb %><br />
        <%= f.text_field :blurb %>
    </div>

    <div class="field">
        <%= f.label :bio %><br />
        <%= f.text_field :bio %>
    </div>

change config/initializers/devise.rb ->
    config.scoped_views = true (need to uncomment)

change app/controllers/application_controller.rb ->
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up)
            { |u| u.permit(:name, :bio, :blurb, :email, :password, :password_confirmation) }
        devise_parameter_sanitizer.permit(:account_update)
            { |u| u.permit(:name, :bio, :blurb, :email, :password, :password_confirmation,
              :current_password) }

~git commit~





<<<>>>ADD PAPERCLIP<<<>>>

add to config/environments/development.rb -> Paperclip.options[:command_path] = "/usr/local/bin/"

brew install imagemagick

add to gemfile -> gem "paperclip", "~> 5.0.0"

CLI: bundle

add to app/models/creator ->
  has_attached_file :avatar, :styles => { :index => "450x450>", :thumb => "200x200>" },
  :default_url => "/images/:style/default_image.png"
  validates_attachment_content_type :avatar,
  :content_type => /\Aimage\/.*\Z/

add to app/views/creators/registrations/edit.html.erb ->
    <div>
    Add Your <%= f.label :avatar %>:
    <%= f.file_field :avatar %>
    </div>

change app/controllers/application_controller.rb ->
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up)
            { |u| u.permit(:name, :bio, :blurb, :email, :password, :password_confirmation) }
        devise_parameter_sanitizer.permit(:account_update)
            { |u| u.permit(:name, :bio, :blurb, :email, :password, :password_confirmation,
              :current_password, :avatar) }

CLI: rails generate paperclip creator avatar
CLI: rake db:migrate

~git commit~





<<<>>>CONTROLLERS, VIEWS, AND ROUTING<<<>>>

CLI: rails g controller static_pages

add to app/controllers/static_pages_controller.rb ->
    def home
    end

add to app/views/static_pages/ -> home.html.erb

add to config/routes.rb ->
    root 'static_pages#home'

CLI: rails g controller creators

add to app/views/creators/index.html.erb ->
    <% @creators.each do |creator| %>
        <div>
          <a href="/creators/<%= creator.id %>">
            <%= image_tag creator.avatar.url(:index), class: "creator" %>
          </a>
        </div>
        <div>
          <%= creator.name %>
        </div>
        <div>
          <%= creator.blurb %>
        </div><br>
    <% end %>

~git commit~





<<<>>>NAV BAR<<<>>>

add to _menu.html.erb ->
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container">

		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse"
		        data-target="#navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <%= link_to "Bindler", root_path, class: 'navbar-brand' %>
		</div>

		<div class="collapse navbar-collapse" id="navbar-collapse-1">
		  <ul class="nav navbar-nav navbar-right">
			<li><%= link_to 'Creators', creators_path %></li>
			<% if current_creator %>
				<li><%= link_to 'Edit Profile',
				        edit_creator_registration_path %></li>
				<li><%= link_to 'Logout', destroy_creator_session_path,
				        method: :delete %></li>
			<% else %>
				<li><%= link_to 'Login', new_creator_session_path %></li>
			<% end %>
		  </ul>
		</div>
	  </div>
	</nav>

add to application.html.erb, in body, above yield tag ->
    <%= render 'layouts/menu' %>

~git commit~