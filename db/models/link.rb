require_relative '../connection'
require 'securerandom'

class Link < ActiveRecord::Base
  validates :long_link, presence: true

  def increase_visit_count!
    self.visit_counter += 1
    self.save
  end

  # Generate short link
  def short!
    short_link = SecureRandom.hex(3)
    existed_link = Link.where(short_link: short_link).last
    if existed_link.present?
      self.short!
    else
      self.short_link = short_link
    end
  end

  # Remove http(s), www. and spaces from the original long link
  def sanitize!
    self.long_link.strip!
    sanitized = self.long_link.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.long_link = "http://#{sanitized}"
  end
end