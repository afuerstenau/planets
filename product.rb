class Product
  attr_reader :name, :product_owner

  def initialize(name, product_owner)
    @name=name
    @product_owner=product_owner
  end
end