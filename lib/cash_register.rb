
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_item = 0
    end

    def add_item(title, price, quantity=1)
        self.total += price*quantity
        quantity.times do
            self.items << title
        end
        @last_item = quantity * price
    end

    def apply_discount
        if self.discount == 0 
            "There is no discount to apply."
        else
             self.total -= ((self.total/100).to_f * self.discount)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @last_item
    end
end