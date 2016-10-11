class Bookmark < ApplicationRecord
	has_and_belongs_to_many :tags
	belongs_to :user

	def save
		
		super

		tag = Tag.find_or_create_by(name: user.name.downcase)
		tags << tag unless tags.include?(tag)

		gist.languages.each do |language|
			tag = Tag.find_or_create_by(name: language.downcase)
			tags << tag unless tags.include?(tag)
		end

	end

	def gist
		@gist ||= Gist.new(Octokit.get(url))
	end

	def user
		ap gist
		User.find_by(name: gist.data.owner.login)
	end

	def self.filter filter
		joins(:tags).where(tags: {name: filter.downcase})	#tags.where(name: filter.downcase)
	end
end
