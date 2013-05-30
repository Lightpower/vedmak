class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many

  # Validations: presence > by type > validates

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes
  class << self

  end

  # Other model methods

  # Private methods (for example: custom validators)

end
