class System < ActiveRecord::Base

  has_many :subsystems, class_name: System, foreign_key: :parent_system_id
  belongs_to :parent_system, class_name: System, foreign_key: :parent_system_id

  has_and_belongs_to_many :links

  def as_json(options={})
    super(
        :only => [
            :name, :description, :visible
        ],
        :include => {
            :parent_system => {
              :only => [
                :name
              ]
            },
            :links => {
                :only => [
                    :title, :link, :visible
                ]
            },
            :subsystems => {
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
            }
        }
    )
  end
end