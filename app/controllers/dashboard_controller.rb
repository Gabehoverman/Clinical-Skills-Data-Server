class DashboardController < ApplicationController
  def index
    @hide_toolbar = true
    js :resources => [
      { name: 'Systems', count: System.count, link: url_for(controller: 'systems', action: 'index')},
      { name: 'Exam Techniques', count: ExamTechnique.count, link: url_for(controller: 'exam_techniques', action: 'index')},
      { name: 'Components', count: Component.count, link: url_for(controller: 'components', action: 'index')},
      { name: 'Muscles', count: Muscle.count, link: url_for(controller: 'muscles', action: 'index')},
      { name: 'Palpations', count: Palpation.count, link: url_for(controller: 'palpations', action: 'index')},
      { name: 'Ranges of Motion', count: RangeOfMotion.count, link: url_for(controller: 'ranges_of_motion', action: 'index')},
      { name: 'Special Tests', count: SpecialTest.count, link: url_for(controller: 'special_tests', action: 'index')},
      { name: 'Image Links', count: ImageLink.count, link: url_for(controller: 'image_links', action: 'index')},
      { name: 'Video Links', count: VideoLink.count, link: url_for(controller: 'video_links', action: 'index')},
      { name: 'Personal Acknowledgements', count: PersonnelAcknowledgement.count, link: url_for(controller: 'personnel_acknowledgements', action: 'index')},
      { name: 'Software Acknowledgements', count: SoftwareAcknowledgement.count, link: url_for(controller: 'software_acknowledgements', action: 'index')},
    ]
  end
end
