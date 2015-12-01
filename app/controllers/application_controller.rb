class ApplicationController < ActionController::API
  Swagger::Docs::Generator::set_real_methods
end
