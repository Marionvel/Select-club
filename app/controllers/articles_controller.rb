class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(article_params)
        if article.save
            flash[:success] = 'Article publié'
            redirect_to article
        else
            flash.now[:danger] = 'Erreur'
            render 'new'
        end
    end

    def show
        @article = Article.find_by_id(params[:id])
    end

    def edit
    end

    def destroy
    end


    private

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
