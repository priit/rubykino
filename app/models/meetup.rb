class Meetup # no table yet
  class << self
    def next_date
      dates.sort {|a,b| a <=> b}.first
    end

    def dates
      [feb, may, aug, nov]
    end

    def feb
      feb = Chronic.parse('last thursday', :now => Chronic.parse('february').end_of_month).to_date
      return feb if feb > Date.today
      Chronic.parse('last thursday', :now => Chronic.parse('february').end_of_month + 1.year).to_date
    end

    def may
      may = Chronic.parse('last thursday', :now => Chronic.parse('may').end_of_month).to_date
      return may if may > Date.today
      Chronic.parse('last thursday', :now => Chronic.parse('may').end_of_month + 1.year).to_date
    end

    def aug
      aug = Chronic.parse('last thursday', :now => Chronic.parse('august').end_of_month).to_date
      return aug if aug > Date.today
      Chronic.parse('last thursday', :now => Chronic.parse('august').end_of_month + 1.year).to_date
    end

    def nov
      nov = Chronic.parse('last thursday', :now => Chronic.parse('november').end_of_month).to_date
      return nov if nov > Date.today
      Chronic.parse('last thursday', :now => Chronic.parse('november').end_of_month + 1.year).to_date
    end

    def last_date
      Chronic.parse('last thursday', :now => (Meetup.next_date - 3.months).end_of_month).to_date
    end
  end
end
