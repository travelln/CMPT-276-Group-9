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
    require 'csv'
    #require 'pathname' #Rails.root returns a Pathname object
    csv_file = Rails.root.join('app', 'assets', 'population.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |key, val|
        @vec[i] << val
      end
      i += 1
    end
  end

  def weather
  end

  def test



  end

end
