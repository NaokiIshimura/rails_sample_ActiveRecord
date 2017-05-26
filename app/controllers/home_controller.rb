class HomeController < ApplicationController
  def index

    ##
    # Fee
    # join : fee(address_id) - address(id)
    #

    # 基本的なjoin
    Fee.joins(:address).where("addresses.id = 2")

    # 別名でのjoin
    Fee.joins(:addr).where("addresses.id = 2")

    # find_byは使えない
    #Fee.joins(:address).find_by(state: 'osaka')



    ##
    # Fee
    # join : dat(status) - address(status)
    #

    # 基本的なjoin
    Day.joins(:address).where("addresses.id = 2")

    # 親のカラム名も取得したい場合
    Day.joins(:address).select("addresses.*, days.*")

    # find_byは使えない
    #Day.joins(:address).find_by(addresses.id : 2)

  end
end
