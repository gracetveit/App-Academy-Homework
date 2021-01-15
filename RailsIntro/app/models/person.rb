# == Schema Information
#
# Table name: people
#
#  id         :integer(8)      not null, primary key
#  name       :string          not null
#  house_id   :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Person < ApplicationRecord
    validates :name, precense: true
    validates :house_id, precense: true
end