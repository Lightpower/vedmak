class TerminalController < ApplicationController
  def index
    
  end

  def login
    pass = get_data(:passwords)[params[:login]]
    render(status: 403, inline: "fail") and return if (pass.blank? || pass["password"] != params["pass"])
    data = get_data(:levels)[pass["key"]]
    render json: { message: data["motd"], auth: pass["key"] }
  end

  def command
    render status: 403, inline: '' and return unless params[:auth]
    data = get_data(:levels)[params[:auth]]
    render inline: "Command not found: #{params[:command]}" and return unless data[params[:command]]
    render inline: data[params[:command]]
  end

  private

    def get_data(name)
      JSON.load(Rails.root.join("db/#{name.to_s}.json"))
    end
end