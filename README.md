# Rails Basis

## 参考
[Rails4で1対多のリレーションをモデルに実装する \- Rails Webook](http://ruby-rails.hatenadiary.com/entry/20141203/1417601540#model-relation-one-n-forigen_key)
[:primary\_keyと:foreign\_keyを同時指定して、主キーではないけど共通なカラム同士で関連付けする \- Qiita](http://qiita.com/jpshadowapps/items/2354f3463c06c109993d)
[Rails における内部結合、外部結合まとめ \- Qiita](http://qiita.com/yuyasat/items/c2ad37b5a24a58ee3d30)


## ActiveRecord
```
$ rails g scaffold address state
$ rails g scaffold fee address_id fee
$ rails g scaffold day state transportation day
```

## 親の「主キー」と子の「親名_id」カラムで関連付ける

### model

address : id
```ruby
has_one :fee
```

fee : address_id
```ruby
belongs_to :address
```

### controller

```ruby
# 基本的なjoin
Fee.joins(:address).where("addresses.id = 1")
```

## 親の「主キー」と子の「親名_id」カラムで関連付けるが、別名でjoinさせる

### model

address : id
```ruby
has_one :fee
```

fee : address_id
```ruby
belongs_to :addr, class_name: 'Address', foreign_key: 'address_id'
```

### controller

```ruby
# 別名でのjoin
Fee.joins(:addr).where("addresses.id = 1")
```


## 親と子で共通するカラム同士で関連付ける

### model

address : state
```ruby
has_many :day, primary_key: 'state', foreign_key: 'state'
```

day : state
```ruby
belongs_to :address, primary_key: 'state', foreign_key: 'state'
```

### controller 
```ruby
# 基本的なjoin
Day.joins(:address).where("addresses.id = 1")
```

## 補足

親のカラムも取得したい場合
```ruby
Day.joins(:address).select("addresses.*, days.*")
```