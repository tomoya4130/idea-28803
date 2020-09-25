class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '生活'},
    { id: 3, name: 'ゲーム'},
    { id: 4, name: 'スポーツ'},
    { id: 5, name: '本'},
    { id: 6, name: '映画'}
    { id: 7, name: 'その他'}
  ]
end
