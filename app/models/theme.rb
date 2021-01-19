class Theme < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '食事内容、介助方法' },
    { id: 2, name: '介護環境の対策' },
    { id: 3, name: 'トイレのケア' },
    { id: 4, name: '散歩のケア' },
    { id: 5, name: '体のケア' },
    { id: 6, name: '寝たきりのケア' },
    { id: 7, name: '介護グッズ' },
    { id: 8, name: '夜泣きの対策' },
    { id: 9, name: '認知症の対策' },
    { id: 10, name: '暑さ対策' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
