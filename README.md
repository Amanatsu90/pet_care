# テーブル設計

## users テーブル

| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| name               | string | null: false | 
| nickname           | string | null: false | 
| email              | string | null: false | 
| encrypted_password | string | null: false | 

### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ | 
| title        | string     | null: false                    | 
| text         | text       | null: false                    | 
| dog_size_id  | integer    | null: false                    | 
| theme_id     | integer    | null: false                    | 
| user         | references | null: false, foreign_key: true | 

### Association

- has_many :users
- has_many :comments
- has_one_attached :image

### ActiveHash Associations

- belongs_to :theme_tag


## comments テーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| text   | text       | null: false                    | 
| user   | references | null: false, foreign_key: true | 
| post   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :post


## favorite テーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| user   | references | null: false, foreign_key: true | 
| post   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :post