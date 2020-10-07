class ProductsController < ApplicationController

  before_action :search_product, only: [:index, :search]

  def index
    @products = Product.all  # 全商品の情報を取得
  end

  def search
    @results = @p.result.includes(:category)  # 検索条件にマッチした商品の情報を取得,最後に10行目で、この@pに対して「.result」とすることで、検索結果を取得しています。これは、検索条件に該当した商品が@pに格納されているので、その格納されている値を表示する役割があります。また、includesメソッドを使用することで「N+1問題」を解消しています。
  end

  private

  def search_product #処理を行うメソッド名を「search_product」としています。
    @p = Product.ransack(params[:q])  # 検索オブジェクトを生成。キー（:q）を使って、productsテーブルから商品情報を探しています。そして、「@p」という名前の検索オブジェクトを生成しています。
  end

end
# ransack
# シンプルな検索フォームと高度な検索フォームの作成を可能にするgemです。
# ransackを導入することで以下のメソッドが使えるようになります。
# メソッド	役割
# _eq	条件に合った検索を行う
# _lteq	「〜以下」という検索条件
