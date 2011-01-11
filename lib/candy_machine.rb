class CandyMachine
  
  def initialize
    @amount = 0
    @change = Hash.new { |hash,key| hash[key] = [] }
    @booty = Hash.new { |hash,key| hash[key] = [] }
    @entered_number = 0
    @products = []
  end
  
  def insert_coin(amount)
    amount = amount.split(' ')
    currency = amount.pop
    if amount.empty?
      amount = 1
    else
      amount = amount[0].to_i
    end

    case currency
    when 'euro'
      raise "Onbekende munt" unless [1,2].include?(amount)
      @booty[currency].push(amount)
      @amount += amount
    when 'eurocent'
      raise "Onbekende munt" unless [1,2,5,10,20,50].include?(amount)
      if amount < 5
        @change[currency].push(amount)
      else
        @change[currency].push(amount)
        @amount += amount / 100.0
      end
    else
      @change[currency].push(amount)
    end
    @display_value = '%.2f' % @amount
  end
  
  def push_abort_button
    # oh hai
    
    @amount = 0.0
    @booty.each do |k,v|
       # yarr i be a pirate here lolz
      @change[k] += v
    end
    @booty = {}
  end

  def read_display
    return @display_value
  end
  
  def returns
    @change.map do |currency, coins|
      coins.map do |coin|
        "#{coin} #{currency}"
      end
    end.flatten.join(", ")
  end
  
  def push_keypad_button(number)
    @entered_number = (@key_presses.to_s + number.to_s).to_i
    @display_value = @entered_number.to_s
    if @entered_number.to_s.length == 2
      @entered_number = ''
      if products[@entered_number]
      else
        @display_value = '404'
      end
    end
      
  end
    
  # insert coins
  # select product
  # receive change
  # 
  # Keep track of stock
  # Keep track of coins
  
end