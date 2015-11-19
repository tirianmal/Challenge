class UserDecorator < RKit::Decorator::Base
  def infos
    "#{ self } - working for #{ company }"
  end
end
