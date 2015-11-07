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
    require 'csv'
    csv_file = Rails.root.join('app', 'assets', 'pollution.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
        if val.to_f != 0.0
          @vec[i] << val.to_f
        end
      end
      i += 1
    end
    @sulfur = Array.new
    @sulfur << 0
    @nitrogen = Array.new
    @nitrogen << 0
    @voc = Array.new
    @voc << 0
    @ammonia = Array.new
    @ammonia << 0
    @carbon = Array.new
    @carbon << 0
    @fpm = Array.new
    @fpm << 0
    for i in 3..25
      @sulfur << @vec[i][1]
      @nitrogen << @vec[i][2]
      @voc << @vec[i][3]
      @ammonia << @vec[i][4]
      @carbon << @vec[i][5]
      @fpm << @vec[i][6]
    end
  end

  def population
    require 'csv'
    csv_file = Rails.root.join('app', 'assets', 'population.csv')
    @vec = Array.new
    i = 0
    CSV.foreach(csv_file, headers:true) do |row|
      @vec.push(Array.new)
      row.each do |_, val|
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
    require 'csv'
    tax_data = CSV.read('tax_data.csv', headers:true)





  end

end
