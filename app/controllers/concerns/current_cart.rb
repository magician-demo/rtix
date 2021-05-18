module CurrentCart
  private
  def find_cart
    @cart = Cart.find(session[:cart9527])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart9527] = @cart.id
  end

  def current_cart
    find_cart
    @cart
  end

  def empty_cart!
    Cart.find_by(id: session[:cart9527]).destroy
    session[:cart9527] = nil
  end
end
