class User < ApplicationRecord
	def self.create_if_exist github_username
		begin
			user = Octokit.user(github_username) #.rels[:gists].get.data.first.files
		rescue Octokit::NotFound
			return false
		end
		create(
			name: user.login,
			g_id: user.id,
			url: user.url,
			html_url: user.html_url,
			gists_url: user.gists_url,
			bio: user.bio
		).save
	end


	def fetch_gists
		gists = Octokit.user(name).rels[:gists].get.data
		
		Gist.build_all gists
	end
end
