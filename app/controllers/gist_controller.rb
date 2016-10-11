class GistController < ApplicationController

	def index
		@bookmarks = Bookmark.all
		render 'bookmarks', layout: 'application'
	end

	def index_by_user
		@gists = User.find_by(name: params['name']).fetch_gists
		render 'gists', layout: 'application'
	end

	def bookmark
		Bookmark.create(
			g_id: params[:g_id],
			url: params[:url],
			html_url: params[:html_url]
		)

		render json: 'Bookmark saved!'
	end

	def filter
		@bookmarks = Bookmark.filter(params[:tag])
		render 'bookmarks', layout: 'application'
	end
end