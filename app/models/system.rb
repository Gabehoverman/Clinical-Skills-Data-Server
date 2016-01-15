class System < ActiveRecord::Base

  has_many :subsystems, class_name: System, foreign_key: :parent_id
  belongs_to :parent, class_name: System, foreign_key: :parent_id

  has_and_belongs_to_many :links

  def pretty_json
    puts JSON.pretty_generate(self.as_json)
  end

  def as_json(options={})
    if options[:subsystems]
      top_level_key = 'subsystem'
    else
      top_level_key = 'system'
    end

    json = {
        top_level_key => super(
            :only => [
                :name, :details, :visible
            ]
        )
    }

    unless parent.nil?
      json[top_level_key]['parent_name'] = parent.name
    end

    json[top_level_key]['links'] = links.as_json

    json
  end
end