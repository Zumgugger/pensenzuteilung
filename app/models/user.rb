# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  school_id              :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_school_id             (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class User < ApplicationRecord
  belongs_to :school
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def self.ransackable_attributes(auth_object = nil)
          ["id", "email", "school_id", "created_at", "updated_at"]
         end
       
           # Explicitly allow searchable associations
         def self.ransackable_associations(auth_object = nil)
           ["school"]  # Add all the associations that you want to be searchable
         end
end
