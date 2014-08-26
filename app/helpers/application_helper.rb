module ApplicationHelper
  def next_meetup_str
    Meetup.next_date.strftime('%A, %dth of %B %Y')
  end
end
