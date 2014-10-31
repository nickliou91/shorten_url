class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_save :shorten_the_url 
  # validates_uniqueness_of :orginal_url
  validate :url_valid?
  # def url_formatting
  # 	original_url = original_url.downcase
  # end

  

  def count_the_visit
  	self.visit_counts = self.visit_counts + 1
  	save
 	end

  	private
  	def shorten_the_url
  		self.shorten_url = (0...8).map { (65 + rand(26)).chr }.join.downcase
  	end


       def url_unique(url)
    Url.where(shorten_link: url).count == 0
  end

  def url_valid?
    uri = URI.parse(self.orginal_url)
    errors.add(:orginal_url, "Not valid url") unless uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
      errors.add(:orginal_url, "Not valid url")
  end



end
