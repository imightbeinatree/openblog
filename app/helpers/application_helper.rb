# Application Helper
module ApplicationHelper
  def published_date(d)
    d.strftime('%b %e, %Y')
  end
end
