module ApplicationHelper
  def date_convert(datetime)
    day_of_week =
      case datetime.wday
      when 0
        '(日)'
      when 1
        '(一)'
      when 2
        '(二)'
      when 3
        '(三)'
      when 4
        '(四)'
      when 5
        '(五)'
      when 6
        '(六)'
      else
        '不存在'
      end

    month_and_date = datetime.to_s.first(10)[5, 9]
    month_and_date[2] = '/'

    month_and_date + day_of_week
  end
end
