class NewsController < ApplicationController
  before_action :admin_user, {only:[:create_form, :create, :edit]}
  
  def index
    @news = News.all.order(created_at: :desc).page(params[:page]).per(6)
  end
  
  def create_form
    
  end
  
  def create
  @news = News.new(title: params[:title],
                   content: params[:content],
                   posting_time: Time.now.to_i)
    if params[:image]
      @news.image_name = "#{@news.posting_time}.jpg"
      image = params[:image]
      File.binwrite("public/content_images/#{@news.image_name}", image.read)
    end
    if @news.save
      flash[:notice] = "投稿完了しました"
      redirect_to("/news/create")
    else
      flash[:alert] = "保存できませんでした"
      render("news/create_form")
    end
    
  end
  
  def article
    @news = News.find_by(posting_time: params[:posting_time])
    
  end
  
  def edit_form
    @news = News.find_by(posting_time: params[:posting_time])
    @title = @news.title
    @content = @news.content
    
  end
  
  def edit
    @news = News.find_by(posting_time: params[:posting_time])
    @news.title = params[:title]
    @news.content = params[:content]
    
    if params[:image]
      @news.image_name = "#{@news.id}.jpg"
      image = params[:image]
      File.binwrite("public/content_images/#{@news.image_name}", image.read)
    end
    
    if @news.save
      flash[:notice] = "編集完了しました"
      redirect_to("/news/#{@news.posting_time}")
    else
      flash[:alert] = "投稿に不備があります"
      @title = @news.title
      @content = @news.content
      render("news/edit_form")
    end
  end
  
  
end
