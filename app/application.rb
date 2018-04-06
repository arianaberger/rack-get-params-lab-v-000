

class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    if req.path.match(/cart/) && !@@cart.empty?
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    elsif
      resp.write "Your cart is empty"    

    elsif req.path.match(/add/)

      # added_item = @@items[0]
      # @@cart << added_item

    # elsif req.path.match(/search/)

      search_term = req.params["q"]

      if @@items.include?(search_term)

        @@cart << search_term[:q]
        binding.pry
        resp.write "added #{item}"
      else
        resp.write "We don't have that item"
      end
    else
      resp.write "Path Not Found"

    else
      resp.write "Path Not Found"
    end
    
    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
