class Sample2Controller < ApplicationController
  def index

    @addresses = Address.all
    @fees = Fee.all

    ##
    # n+1問題
    #
    puts '>>> NGパターン'

    fees = Fee.all
    fees.each do |f|
      f.address.state
    end

    puts '>>> OKパターン'

    fees = Fee.all.includes(:address)
    fees.each do |f|
      f.address.state
    end

  end
end
