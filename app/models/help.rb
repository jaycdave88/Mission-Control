class Help < ActiveRecord::Base
  belongs_to :sticky
  belongs_to :user
end