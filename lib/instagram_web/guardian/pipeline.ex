defmodule InstagramWeb.Guardian.Pipeline do
  use Guardian.Plug.Pipeline,
  otp_app: :instagram,
  error_handler: InstagramWeb.Guardian.ErrorHandler, # エラーハンドリングは別モ ジュールで定義
  module: InstagramWeb.Guardian
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"} # セッション情 報に含まれるJWTの検証
  plug Guardian.Plug.LoadResource, allow_blank: true # JWTからユーザデータを取得
end
