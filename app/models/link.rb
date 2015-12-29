class Link < ActiveRecord::Base

  has_and_belongs_to_many :systems

  def pretty_json
    puts JSON.pretty_generate(self.as_json)
  end

  def as_json(options={})
    json = {}
    json['link'] = super(
        :only => [
            :title, :link, :visible
        ]
    )

    json
  end
end