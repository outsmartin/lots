require 'nokogiri'
require 'open-uri'
module Lots
  ALLIANCE = 'http://zoywiki.com/index.php/LotS/raids/alliance'
  GENERAL = 'http://zoywiki.com/index.php/LotS/raids/general'
  def grabber
    doc = Nokogiri::HTML(open(ALLIANCE))
    raids = doc.css('#bodyContent ul li a')
    allyraids = raids.map do |raid|
      'http://zoywiki.com'+ raid['href']
    end
    doc = Nokogiri::HTML(open(GENERAL))
    raids = doc.css('#bodyContent ul li a')
    raids = raids.map.reject do |raid|
      raid['href'][0] == '#'
    end
    generalraids = raids.map do |raid|
      'http://zoywiki.com' + raid['href']
    end
    all_raids = generalraids + allyraids
    parsepage all_raids[0]
  end
  def parsepage list
    list.map do |url|
      puts url
      page = Nokogiri::HTML open(url)
      health = page.css('tr:nth-child(6) tr')[1..4].map{|a| Hash[*a.text.split("\n")]}
      {
        name: page.css('div tr:nth-child(1) td')[1].text.strip,
        type: page.css('div tr:nth-child(2) td')[1].text.strip,
        players: page.css('div tr:nth-child(3) td')[0].text.strip,
        time: page.css('div tr:nth-child(4) td')[0].text.strip,
        url: url,
        :health => health
      }
    end
  end
end
