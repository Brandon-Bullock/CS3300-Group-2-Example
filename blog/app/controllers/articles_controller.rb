class ArticlesController < ApplicationController
    
    def index
       @articles = Article.all 
    end
    
     #show action
    def show 
        @article = Article.find(params[:id])
    end
    
    # new action
    def new
        @article = Article.new
    end
    
    #edit article action
    def edit
       @article = Article.find(params[:id]) 
    end
    
    # create action
    def create
        @article = Article.new(article_params)
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    # update article action
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    # delete article action
    def destroy
       @article = Article.find(params[:id]) 
       @article.destroy
       
       redirect_to articles_path
    end
    
    # **PRIVATE METHODS**
    private 
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
