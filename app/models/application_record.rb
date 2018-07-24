class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
validates :title, :body, presence: true

end
