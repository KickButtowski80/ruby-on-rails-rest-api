module Api
    module V1
        class ArticlesController < ApplicationController 
            def index
                @articles = Article.order('created_at DESC')
                render json: {status: "SUCCESS", message: 'Loaded artilces', data: @articles}, status: :ok
            end
            
            def show
                @article = Article.find(params[:id])
                render json: {status: "SUCCESS" , message: "Loaded an artilce", data: @article}, status: :ok
            end
            
            def create 
                @artilce = Article.new(article_params)
                if @artilce.save
                    render json: {status: "SUCCESS" , message: "Saved an artilce", data:  @artilce}, status: :ok
                else
                    render json: {status: "ERROR" , message: "Artilce not saved", data: @article.error}, status: :unprocessable_entity
                end
            end
            
            
            def destroy
                @article = Article.find(params[:id])
                @article.destroy
                render json: {status: "SUCCESS" , message: "Deleted an artilce", data:  @article}, status: :ok                
            end
            
            def update 
                @article = Article.find(params[:id])
                if @article.update_attributes(article_params)
                     render json: {status: "SUCCESS" , message: "Updated an artilce", data:  @article}, status: :ok
                else
                    render json: {status: "ERROR" , message: "Artilce not Updated", data: @article.error}, status: :unprocessable_entity
                end
            end
                    
            
            
            
            
            
            private
            
            def article_params
                params.permit(:title, :body)
            end
        end        
    end
end




