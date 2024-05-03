class ClimaController < ApplicationController
  def index
    #url = "https://api.openweathermap.org/data/2.5/weather?lat=-27.2342&lon=-52.02&appid=55addd805507370ca3c6f486e3b4f256"
    url = "https://api.openweathermap.org/data/2.5/weather?lat=-27.2342&lon=-52.02&appid=55addd805507370ca3c6f486e3b4f256"

    uri = URI(url)
    res = Net::HTTP.get_response(uri)

    @data = JSON.parse(res.body)

    temperature_kelvin2 = @data['main']['temp']
    temperature_celsius = temperature_kelvin2 - 273.15

    @temperature_celsius = temperature_celsius.round

    velocidade_do_vento_ms = @data['wind']['speed']
    velocidade_do_vento_km = velocidade_do_vento_ms * 1.609
    @velocidade_do_vento_km = velocidade_do_vento_km.round


    if @temperature_celsius >= 22
      @icon_url = "Sol.png"

    elsif @temperature_celsius >= 18 && @data['weather'].first['main'] == 'Rain'
      @icon_url = "Nublado_Chuva.png"

    elsif @temperature_celsius >= 18 && @data['weather'].first['main'] == 'Clouds'
      @icon_url = "Nublado.png"

    elsif @temperature_celsius >= 18 && @data['weather'].first['main'] != 'Clouds' && @data['weather'].first['main'] == 'Rain'
      @icon_url = "Sol_fraco.png"

    elsif @temperature_celsius <= 8
      @icon_url = "Muito_frio.png"

    end
  end
end
