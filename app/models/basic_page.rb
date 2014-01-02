class BasicPage
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  #before_filter :require_login, :only => :root
end
