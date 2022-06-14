module Api::UserAuthenticator
  extend ActiveSupport::Concern

  def current_user
    return @current_user if @current_user
    return unless bearer_token

    # トークンを復元し、payloadに格納
    payload, = User.decode(bearer_token)
    # payloadのuser_idの情報をもとにuserを検索
    # @current_userがnil,falseの場合検索したデータを代入
    @current_user ||= User.find_by(id: payload['user_id'])

    # 例外処理
  rescue JWT::ExpiredSignature
    nil
  end

  def authenticate!
    return if current_user

    head :unauthorized
  end

  def bearer_token
    pattern = /^Bearer /
    # headerに「Authorization: Bearer token」が入る
    header = request.headers['Authorization']

    # token部分のにをheaderに入れる
    header.gsub(pattern, '') if header&.match(pattern)
  end
end
