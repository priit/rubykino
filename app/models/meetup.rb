class Meetup # no table yet
  class << self
    def next_date
      meetup_dates.sort {|a,b| a <=> b}.first
    end

    def meetup_dates
      [feb, may, aug, oct]
    end

    def feb
      (Chronic.parse('thursday of next March') - 1.week).to_date
    end

    def may
      (Chronic.parse('thursday of next June') - 1.week).to_date
    end

    def aug
      (Chronic.parse('thursday of next September') - 1.week).to_date
    end

    def oct
      (Chronic.parse('thursday of next November') - 1.week).to_date
    end

    def last_date
      last_feb = (Chronic.parse('thursday of last March') - 1.week).to_date
      last_may = (Chronic.parse('thursday of last June') - 1.week).to_date
      last_aug = (Chronic.parse('thursday of last September') - 1.week).to_date
      last_oct = (Chronic.parse('thursday of last November') - 1.week).to_date
      [last_feb, last_may, last_aug, last_oct].sort {|a,b| a <=> b}.last
    end
  end
end
