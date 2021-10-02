class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def claim
    article = Article.find(params[:id])
    
    if article.stock.to_i < claim_params[:account].to_i
      return render json: { errors: 'No Hay stock suficiente para este articulo' }, status: 406
    end

    if current_user.score < (claim_params[:account].to_i * article.score.to_i)
      return render json: { errors: 'No tienes puntos suficientes para Redimir' }, status: 406
    end

    article_user = ArticleUser.new(
      user_id: current_user.id,
      article_id: article.id,
      account: claim_params[:account],
      score: article.score
    )

    if article_user.save
      current_user.score =  current_user.score - (article.score * claim_params[:account].to_i)
      current_user.save

      article.stock = article.stock - claim_params[:account].to_i
      article.save
      render json: { article_user: article_user }, status: 200
    else
      render json: { errors: 'No fue posible guardar' }, status: 200
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:name, :stock, :rate, :score)
    end

    def claim_params
      params.require(:claim).permit(:account)
    end
end
