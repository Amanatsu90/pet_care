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
| theme_tag_id | integer    | null: false                    | 
| theme_tag_id | integer    |                                | 
| theme_tag_id | integer    |                                | 
| theme_tag_id | integer    |                                | 
| theme_tag_id | integer    |                                | 
| dog_size_id  | integer    | null: false                    | 
| user         | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image

### ActiveHash Associations

- belongs_to :theme_tag
- belongs_to :dog_size


## comments テーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| text   | text       | null: false                    | 
| user   | references | null: false, foreign_key: true | 
| post   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :posts