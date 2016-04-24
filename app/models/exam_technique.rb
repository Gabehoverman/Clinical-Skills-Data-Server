class ExamTechnique < ActiveRecord::Base

  belongs_to :system

  has_and_belongs_to_many :image_links
  has_and_belongs_to_many :video_links

  validates :name, :uniqueness => true

	def self.api_all
		json = []
		ExamTechnique.all.each do |exam_technique|
			json.push(
				exam_technique.as_json(root: true)
			)
		end
		return json
	end

	def self.api_for_system_name(system_name)
		json = []
		system = System.where('lower(name) = ?', system_name.downcase).first
		unless system.nil?
			exam_techniques = system.exam_techniques
			exam_techniques.each do |exam_technique|
				json.push(
					exam_technique.as_json(root: true)
				)
			end
		end
		return json
	end

end
