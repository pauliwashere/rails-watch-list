class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])

    @bookmarks = Bookmark.where(list_id: @list.id)
    # @bookmark.movie_id
    @movies = []
    @bookmarks.each do |bookmark|
      movie_id = bookmark.movie_id
      @movies << Movie.find(movie_id)
    end
    @bookmark = Bookmark.find(params[:movie_id])
    # movies.each do |movie|
    #   @movies = Movie.find(movie)
    # end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
