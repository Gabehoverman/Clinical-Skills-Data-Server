class System < ActiveRecord::Base

  has_and_belongs_to_many :links

  def as_json(options={})
    if options.has_key?(:without_links)
      super(
        :only => [
          :name, :description, :visible
        ]
      )
    else
      super(
          :only => [
              :name, :description, :visible
          ],
          :include => {
              :links => {
                  :only => [
                      :title, :link, :visible
                  ]
              }
          }
      )
    end
  end
end