class ImageLink < ActiveRecord::Base

  has_and_belongs_to_many :exam_techniques
  has_and_belongs_to_many :special_tests

  validates :title, :uniqueness => true

	def self.api_all
		json = []
		ImageLink.all.each do |image_link|
			json.push({
				:image_link => image_link.as_json
			})
		end
		return json
	end

	def self.api_for_special_test_name(special_test_name)
		json = []
		special_test = SpecialTest.where('lower(name) = ?', special_test_name.downcase).first
		unless special_test.nil?
			image_links = special_test.image_links
			image_links.each do |image_link|
			json.push({
				:image_link => image_link.as_json
			})
			end
		end
		return json
	end

end
