class CodeController < ApplicationController
    skip_before_action :verify_authenticity_token # This disables the csrf protection, because it wasn't working with bruno
    # post "code/:name" => "code#create", as: :create_code
    def create
        # This function creates a new code entry, if it doesn't already exist, with the 
        name = params[:name]
        value = params[:value]
        render json: { name: name, value: value }, status: :created
    end
    # post "value/:name" => "code#update", as: :update_value
    def update
        name = params[:name]
        value = params[:value]
        render json: { name: name, value: value }, status: :ok
    end
    # get "value/:name" => "code#value", as: :get_value
    def value
        name = params[:name]
        value = "Sample Value" # This would typically fetch the value from a database or service
        render json: { name: name, value: value }, status: :ok
    end
    # delete "code/:name" => "code#delete", as: :delete_value
    def delete
        name = params[:name]
        # Logic to delete the value associated with the name
        render json: { message: "Value for #{name} deleted" }, status: :no_content
    end
end
