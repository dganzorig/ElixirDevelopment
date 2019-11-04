defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  # params is return value of init() function above
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = (user_id && Repo.get(User, user_id)) ->
        assign(conn, :user, user)
      true -> # fallback
        assign(conn, :user, nil)
    end
  end
end
