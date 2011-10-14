class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :firstName, :lastName, :companyId, :email, :password, :password_confirmation, :roles
  
  validates_confirmation_of :password
  validates_presence_of :firstName, :lastName, :password, :email, :roles, :on => :create
  validates_uniqueness_of :email
  
  has_many :tests
  
  # Role IDs
  ROLE_ADMIN = 1
  ROLE_COMPANY_ADMIN = 2
  ROLE_RECRUITER = 3
  ROLE_HIRING_MANAGER = 4
  ROLE_CANDIDATE = 5

  # Role names
  ROLE_STR_ADMIN = "Admin"
  ROLE_STR_COMPANY_ADMIN = "Company admin"
  ROLE_STR_RECRUITER = "Recruiter"
  ROLE_STR_HIRING_MANAGER = "Hiring manager"
  ROLE_STR_CANDIDATE = "Candidate"

end
