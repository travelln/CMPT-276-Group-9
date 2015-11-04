class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def crime
  end

  def economic
  end

  def education
  end

  def pollution
  end

  def population
  end

  def weather
  end

  def test
    require 'csv'
    tax_data = CSV.read('tax_data.csv', headers:true)





  end

end
