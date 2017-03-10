class Url < ActiveRecord::Base
validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "you have entered an invalid URL"}
  validates :long_url, uniqueness: true
  before_create :shorten
	# This is Sinatra! Remember to create a migration!
  def shorten
    self.short_url = SecureRandom.hex(5)
  end
end
