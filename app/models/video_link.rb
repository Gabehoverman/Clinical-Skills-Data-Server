class VideoLink < ActiveRecord::Base

  has_and_belongs_to_many :exam_techniques
  has_and_belongs_to_many :special_tests

  validates :title, :uniqueness => true

	def self.api_all
		json = []
		VideoLink.all.each do |video_link|
			json.push(video_link.as_json(root: true, include: {
					exam_techniques: { only: [:id, :name] },
					special_tests: { only: [:id, :name] }
			}))
		end
		return json
	end

	def self.api_for_special_test_name(special_test_name)
		json = []
		special_test = SpecialTest.where('lower(name) = ?', special_test_name.downcase).first
		unless special_test.nil?
			video_links = special_test.video_links
			video_links.each do |video_link|
			json.push(video_link.as_json(root: true, include: {
					exam_techniques: { only: [:id, :name] },
					special_tests: { only: [:id, :name] }
			}))
			end
		end
		return json
	end

	def self.api_for_exam_technique_name(exam_technique_name)
		json = []
		exam_technique = ExamTechnique.where('lower(name) = ?', exam_technique_name.downcase).first
		unless exam_technique.nil?
			video_links = exam_technique.video_links
			video_links.each do |video_link|
			json.push(video_link.as_json(root: true, include: {
					exam_techniques: { only: [:id, :name] },
					special_tests: { only: [:id, :name] }
			}))
			end
		end
		return json
	end

end
