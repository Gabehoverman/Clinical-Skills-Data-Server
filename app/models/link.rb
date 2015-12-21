class Link < ActiveRecord::Base

  has_and_belongs_to_many :systems

  def as_json(options={})
    super(
        :only => [
            :title, :link, :visible
        ]
    )
  end
end