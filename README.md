# Blogpermission

Permission Control Example with Pundit and Rolify

## Install

```sh
bundle install
rails db:migrate
```

## Usage

```ruby
# User:1 を :admin に追加する。
# :admin に、Articleクラスへのupdate権限を追加する。

user = User.find(1)
user.add_role(:admin)

part = Part.find_by(name: :admin)
part.add_role(:update, Article)
```
