class CodeController < ApplicationController
    skip_before_action :verify_authenticity_token # This disables the csrf protection, because it wasn't working with bruno
    # post "code/:name" => "code#create", as: :create_code
    def create
        # This function creates a new code entry, if it doesn't already exist, with the 
        name = params[:name]
        value = params[:value]
        access_token = SecureRandom.uuid
        delete_token = SecureRandom.uuid
        require_access_read = params[:require_access_read] || false
        require_access_write = params[:require_access_write] || false
        code = CodeItem.new(
            name: name,
            value: value,
            access_token: access_token,
            delete_token: delete_token,
            require_access_read: require_access_read,
            require_access_write: require_access_write
        )
        if code.save
            render json: { name: code.name, value: code.value, access_token: code.access_token, delete_token: code.delete_token }, status: :created
        else
            render json: { errors: code.errors.full_messages }, status: :unprocessable_entity
        end
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
        
        render json: { name: name, value: value }, status: :ok
    end
    # delete "code/:name" => "code#delete", as: :delete_value
    def delete
        name = params[:name]
        # Logic to delete the value associated with the name
        render json: { message: "Value for #{name} deleted" }, status: :no_content
    end
end
