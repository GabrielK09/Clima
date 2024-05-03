module ClimaHelper
  def data_br(date_us)
    date_us.strftime('%d/%m/%Y')

  end

  def dia_semana(day)
    day.strftime('%A')

  end

  def hora(hour)
    hour.strftime('%H:%M')

  end
end
