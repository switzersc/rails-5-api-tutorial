class Swagger::Docs::Config
  def self.base_api_controller
    ActionController::API
  end
end
Swagger::Docs::Config.register_apis({
    "1.0" => {
        :controller_base_path => "",
        # the extension used for the API
        :api_extension_type => :json,
        # the output location where your .json files are written to
        :api_file_path => "public",
        # the URL base path to your API
        :base_path => "http://api.booksapp.com",
        # if you want to delete all .json files at each generation
        :clean_directory => false,
        # add custom attributes to api-docs
        :attributes => {
            :info => {
                "title" => "Bookstore App",
                "description" => "This is an API for an online bookstore",
                "termsOfServiceUrl" => "https://github.com/switzersc/rails-5-api-tutorial",
                "contact" => "shelbyswitzer@gmail.com",
                "license" => "Apache 2.0",
                "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
            }
        }
    }
})