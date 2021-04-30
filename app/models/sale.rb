class Sale < ActiveRecord::Base

  # Active Record Scopes
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
  # The other way to implement is
  # scope: :active, -> { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)}


  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
