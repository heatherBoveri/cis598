class TvSeason < ActiveRecord::Base
	attr_accessible :tv_show_id, :number

	has_many :ratings, :as => :rateable, :dependent => :destroy
	has_many :reviews, :as => :reviewable, :dependent => :destroy
	has_many :tv_episodes, :dependent => :destroy
	has_many :genres, :through => :tv_show

	belongs_to :tv_show
	
	validates :tv_show_id, :number, :presence => { :message => "This field is required."}
	validates :number, :numericality => { :only_integer => true, :message => "Number must be an integer."}

	default_scope :order => "number ASC"
	def self.episodes(id)
      TvEpisode.where('tv_season_id = '+id.to_s).order("number asc").select('id as tv_episode_id, number, air_date')
    end
end

