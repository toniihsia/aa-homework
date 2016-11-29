module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toys(name)
    # the name is the name of the toy, not the animal
    self.toys.find_or_create_by(name: name)
  end
end
