class Gist
	attr_reader :data

	def initialize arr
		@data = arr
	end

	def as_json(options = { })
		super.merge({bookmarked: bookmarked?})
	end

	def bookmarked?
		Bookmark.exists?(g_id: @data[:id])
	end

	def languages
		languages = []
		@data.files.each do |file|
			ap file
			languages << file[1].language
		end
		languages
	end

	def self.build_all json_gists
		json_gists.map! do |gist|
			self.new gist
		end
	end
end