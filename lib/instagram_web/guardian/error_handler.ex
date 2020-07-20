defmodule InstagramWeb.Guardian.ErrorHandler do
  use InstagramWeb, :controller
  @behaviour Guardian.Plug.ErrorHandler
  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _}, _) do
    case type do
      :unauthenticated -> # ログインが必要な画面でログインしていない場合、ログインを促す
        conn
        |> put_flash(:error, "Please login.")
        |> redirect(to: Routes.session_path(conn, :new))
        :already_authenticated -> # ログイン前にアクセスする画面ですでにログインしている場合、ログイン済みの旨を表示する
        conn
        |> put_flash(:error, "Already authenticated.") |> redirect(to: Routes.post_path(conn, :index))
    end
  end
end
