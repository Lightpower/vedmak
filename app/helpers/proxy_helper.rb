module ProxyHelper
  def old_proxies_hidden(f, params)
    return '' unless params

    f.hidden_field(:old_proxies, params)
  end
end
