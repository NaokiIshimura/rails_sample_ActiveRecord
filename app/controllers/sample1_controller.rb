class Sample1Controller < ApplicationController
  def index

    @addresses = Address.all
    @fees = Fee.all
    @days = Day.all

    ##
    # Fee
    # join : fee(address_id) - address(id)
    #

    # 基本的なjoin
    @join1 = Fee.joins(:address).where("addresses.state = 'tokyo'")

    # 別名でのjoin
    @join2 = Fee.joins(:addr).where("addresses.state = 'tokyo'")

    # find_byは使えない
    #Fee.joins(:address).find_by(state: 'osaka')


    ##
    # Fee
    # join : dat(status) - address(status)
    #

    # 基本的なjoin
    @join3 = Day.joins(:address).where("addresses.state = 'tokyo'")

    # 親のカラム名も取得したい場合
    @join4 = Day.joins(:address).select("addresses.*, days.*").where("addresses.state = 'tokyo'")

    # find_byは使えない
    #Day.joins(:address).find_by(addresses.id : 2)

  end
end
