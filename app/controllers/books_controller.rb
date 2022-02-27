class BooksController < ApplicationController

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # フラッシュメッセージの実装
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      # renderの前に定数を定義させ、一覧画面へ遷移できるよう設定
      @books = Book.all
      render :index
    end
  end

  # 投稿一覧ページのアクション
  def index
    # 保存されている全レコードの取得用変数
    @books = Book.all
    # 新規レコード登録用変数
    @book = Book.new
  end

  # 投稿詳細ページのアクション
  def show
    @books = Book.find(params[:id])
  end

  # 投稿編集ページのアクション
  def edit
    @books = Book.find(params[:id])
  end

  # 更新機能
  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    # フラッシュメッセージの実装
    if @books.update(book_params)
      redirect_to book_path(@books), notice: 'Book was successfully updated.'
    else
      # 何も入力欄に入力されていない場合の処理
      render :edit

    end
  end

  # 削除機能
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      # 削除実行後のフラッシュメッセージの実装
      flash[:notice] = 'Book was successfully destroyed'
    redirect_to books_path
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
