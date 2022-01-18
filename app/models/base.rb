# == Schema Information
#
# Table name: bases
#
#  id          :integer          not null, primary key
#  base_number :integer
#  base_name   :string
#  base_status :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Base < ApplicationRecord
  validates :base_number, presence: true
  validates :base_name, presence: true
  validates :base_status, presence: true
end
