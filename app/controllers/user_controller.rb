class UserController < ApplicationController
	def index
		render json: User.all #_with_links
	end

	def create
		# render json: Octokit.get("https://api.github.com/users/tfrangi/gists")
		# render json: Octokit.user('qsfqsfqsfaercfaer') #.rels[:gists].get.data.first.files
		
		render json: User.create_if_exist(params[:name]) ? 'user created' : 'error'
	end
end