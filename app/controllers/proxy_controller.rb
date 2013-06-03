# encoding: UTF-8
class ProxyController < ApplicationController

  def show
    if current_user.present?
      if params[:proxy]
        @old_proxies = params[:old_proxies]

        if params[:proxy][:data].present?
          @old_data = params[:proxy][:data]
          proxies = [
              {ip: '78.140.206.46', url: 'http://fantlab.ru/work10049'},
              {ip: '212.40.42.154', url: 'http://lib.misto.kiev.ua/WASILXEW/wiedzmin.txt'},
              {ip: '5.9.54.77', url: 'http://www.livelib.ru/book/1000090825'},
              {ip: '23.78.66.217', url: 'https://itunes.apple.com/de/app/vladimir-vasil-ev.-ved-mak/id399612486?mt=8'},
              {ip: '195.216.243.39', url: 'http://vladimirvasiliev.ru/'},
              {ip: '91.198.174.225', url: 'http://ru.wikipedia.org/wiki/Васильев,_Владимир_Николаевич_(фантаст))'},
              {ip: '81.176.66.165', url: 'http://www.rusf.ru/boxa/'},
              {ip: '91.189.80.64', url: 'http://classic.dzzzr.ru/mega-kiev/?section=anons&league=2'}
          ]

          new_proxy = proxies.select {|obj| obj[:ip] == @old_data}.first
          if new_proxy.present?
            @url = new_proxy[:url]
            if @old_proxies.blank?
              @old_proxies = @old_data
            elsif @old_proxies.index(@old_data).blank?
              @old_proxies += ';' + @old_data
            end
          else
            flash[:error] = '404 Proxy not found'
          end
        end
      end
      @level = @old_proxies.present? ? @old_proxies.split(';').size : 0
    else
      flash[:error] = '403 Access Denied'
    end
  end
end