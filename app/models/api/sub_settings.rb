class Api::SubSettings
  include Mongoid::Document

  # Fields
  field :http_method, :type => String
  field :regex, :type => String

  # Relations
  embedded_in :api
  embeds_one :settings, :class_name => "Api::Settings"

  # Validations
  validates :http_method,
    :inclusion => { :in => %w(any GET POST PUT DELETE HEAD TRACE OPTIONS CONNECT PATCH) }

  # Mass assignment security
  attr_accessible :http_method, :regex, :settings_attributes
  accepts_nested_attributes_for :settings
end