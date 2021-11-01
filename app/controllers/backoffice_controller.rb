class BackofficeController < ApplicationController
  #  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_admin!

  layout "backoffice"
end
