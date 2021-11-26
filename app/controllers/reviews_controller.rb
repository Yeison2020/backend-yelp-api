class ReviewsController < ApplicationController
    def index 
        review = Review.all 
        if review 
            render json: review, status_code: :ok

        else  
            render json: {error: 'Not found reviews'}, status_code: :not_found

        end


    end

    def show 
        review = Review.find_by(id: params[:id])
        if review 
            render json: review, status: :ok
        else  
            render json: {error: 'No review have been found'}, status: :not_found
        end

    end
    def create
        review = current_user.reviews.create(content: params[:content], business_id: Business.first)
        render json: review, status: :created 
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity    
    end




    private 
    # def review_params 
    #     params.permit(:content)
    # end
end
