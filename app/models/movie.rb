class Movie < ApplicationRecord

  has_many :reviews

  validates :title, presence: true

  validates :director, presence: true

  validates :runtime_in_minutes, numericality: { only_integer: true }

  validates :description, presence: true

  validates :image, presence: true

  validates :release_date, presence: true

  validate :release_date_is_in_the_past

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("director LIKE ?", "%#{search}%")
    where("runtime_in_minutes LIKE ?", "%#{search}%")
  end



  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size unless reviews.empty?
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end


end
