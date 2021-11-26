class BusinessesController < ApplicationController
    # GET  returns all the businesses in the database
    def index
        business  = Business.all
        if business
            render json: business
        else
            render json: {error: "Business Not found"}, status: :not_found   
        end
    end


    # GET return one expecific business in the database
    def show 
        business = Business.find_by(id: params[:id])
        if business
            render json: business, status: :ok 

        else 
           render json: {error: 'Business No found here'}, status_code: :not_found
        end
    end

    # create a business to teh database

    def create 
        new_business = Business.create(business_params)
        render json: new_business, status: :created
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity

    end

    # Update the business data

    def update
        business = Business.find_by(id: params[:id])
        if business && business.update(business_params)
            render json: business, status: :ok
        else  
            render json: {error: 'Business not found'}, status_code: :not_found
        end


    end





    # Private method only available in the database
    private 


    def business_params 
        params.permit(:name, :category, :city, :state, :zip_code)
    end



end
