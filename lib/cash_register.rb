
class CashRegister

  attr_accessor :total, :discount, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end


  def add_item(title, price, quantity = 0)
    if quantity != 0
      @total += price * quantity
      quantity.times {@items << title}
    else
      @total += price
      @items << title
    end
    @last_item = price
  end

  def apply_discount
    if discount > 0
      @total = total - (total * (discount.to_f / 100))
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_item
  end

end
