# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  email                      :string           not null
#  password_digest            :string
#  remember_digest            :string
#  admin                      :boolean          default(FALSE), not null
#  department                 :string
#  basic_time                 :datetime         default(Sun, 23 Jan 2022 08:00:00 JST +09:00), not null
#  work_time                  :datetime         default(Sun, 23 Jan 2022 07:30:00 JST +09:00), not null
#  superior                   :boolean          default(FALSE), not null
#  designated_work_start_time :datetime         default(Sun, 23 Jan 2022 09:00:00 JST +09:00), not null
#  designated_work_end_time   :datetime         default(Sun, 23 Jan 2022 18:00:00 JST +09:00), not null
#  finish_time                :datetime
#  affiliation                :string
#  employee_number            :integer
#  uid                        :string
#  title                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  
  has_many :attendances, dependent: :destroy
  has_many :attendance_change_approval_logs, dependent: :destroy
  #has_many :bases, class_name: "Base", dependent: :destroy
  
  attr_accessor :remember_token
  
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
                    
  validates :affiliation, length: { in: 3..30 }, allow_blank: true
  validates :employee_number, length: {maximum: 4}
  validates :basic_time, presence: true
  validates :designated_work_start_time, presence: true
  validates :designated_work_end_time, presence: true
  validates :work_time, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true               
 
 #def self.search(search)
  #return User.all unless search
   #User.where(['name LIKE ?', "%#{search}%"])
 #end

 def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
 end
 
 
 def User.new_token
  SecureRandom.urlsafe_base64
 end
 
 def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
 end
 
 
 def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
 end

 def forget
  update_attribute(:remember_digest, nil)
 end
 
 def working_user
  if User.find(id: working_user).attendances.(worked_on: Date.today).started_at.present? && finished_at.nil?
   return @working_user.employee_number, @working_user.name
  end
 end
 
 
 def self.import(file)
  CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
    user = find_by(id: row["id"]) || new
    user.attributes = row.to_hash.slice(*updatable_attributes)
    user.save
  end
 end
 
 def self.updatable_attributes
  ["name", "email", "affliation", "employee_number", "uid", "basic_work_time", "designated_work_start_time", "designated_work_end_time", "superior", "admin", "password"]
 end
 

 



end
