class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def crime
    require 'csv'
    
    a=Rails.root.join('app', 'assets', 'Police personnel and selected crime statistics, Canada, provinces and territories.csv')
    @vec = Array.new
    i=0
    CSV.foreach(a, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |key, val|
        if val.to_f == 0.0
          @vec[i] << val
        else
          @vec[i] << val.delete(',').to_f
        end
      end
      i += 1
    end

    c=Rails.root.join('app', 'assets', 'Crimes, by actual offences.csv')
    @vec3 = Array.new
    k=0
    CSV.foreach(c, headers:true) do |row|
      @vec3.push(Array.new)
      row.each do |key, val|
        if val.to_f == 0.0
          @vec3[k] << val
        else
          @vec3[k] << val.delete(',').to_f
        end
      end
      k += 1
    end

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
        if val.to_f == 0.0
          @vec[i] << val
        else
          @vec[i] << val.delete(',').to_f
        end
      end
      i += 1
    end
  end

  def weather
  end

  def test



  end

end
