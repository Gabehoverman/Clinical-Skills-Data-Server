class SpecialTest < ActiveRecord::Base

  belongs_to :component

  has_and_belongs_to_many :image_links
  has_and_belongs_to_many :video_links

  validates :name, :presence => true
  validates :name, :uniqueness => true

	def self.api_all
		json = []
		SpecialTest.all.each do |special_test|
			json.push(special_test.as_json(root: true, include: {
					component: { only: [:id, :name] },
					image_links: { only: [:id, :title] },
					video_links: { only: [:id, :title] }
				}
			))
		end
		return json
	end

	def self.api_for_component_name(component_name)
		json = []
		component = Component.where('lower(name) = ?', component_name.downcase).first
		unless component.nil?
			special_tests = component.special_tests
			special_tests.each do |special_test|
			json.push({
				:special_test => special_test.as_json
			})
			end
		end
		return json
	end

end
