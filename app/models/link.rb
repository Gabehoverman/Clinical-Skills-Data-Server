class Link < ActiveRecord::Base

  has_and_belongs_to_many :systems

  def pretty_json
    puts JSON.pretty_generate(self.as_json)
  end

  def as_json(options={})
    super(
        :only => [
            :title, :link, :visible
        ]
    )
  end
end