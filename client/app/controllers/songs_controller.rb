class SongsController < ApplicationController
  before_action :set_songs, only: :index
  before_action :set_song, only: [:show, :update, :destroy]
  before_action :set_album

  def index
    respond_with(@songs)
  end

  def show
    respond_with(@song)
  end

  def create
    @song = songs.new(song_params)
    @song.save
    respond_with(@song)
  end

  def update
    @song.update(song_params)
    respond_with(@song)
  end

  def destroy
    @song.destroy
    respond_with(@song)
  end

  private
    def songs
      @album ? @album.songs : Song
    end

    def set_songs
      @songs = songs.where(song_params)
    end

    def set_song
      @song = Song.find(params[:id]).decorate
    end

    def song_params
      params.permit(:name, :album_id)
    end

    def set_album
      @album = Album.find(params[:album_id]) if params[:album_id]
    end
end
