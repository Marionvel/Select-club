class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    include SessionsHelper
    #Appel de SessionsHelper dans les controllers.

end
