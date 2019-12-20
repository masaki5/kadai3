#deviceのコントローラに修正が必要な時ここで記述
class ApplicationController < ActionController::Base
  #ログイン認証されていなければ、ログイン画面へリダイレクトする機能を実装できる。
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能（ユーザー登録、ログイン認証など）使われる前にconfigure_premitted_parametesが実行される
  protected
  def configure_permitted_parameters
    added_attrs = [ :username, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  #congigure_premitted_parametesではdevise_parameter_sanitizer.premitでnameのデータ操作を許可するアクションメゾットが指定されてる。
end
