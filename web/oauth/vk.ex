defmodule VK do
  @moduledoc """
  An OAuth2 strategy for VK.
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  defp config do
    [strategy: VK,
     site: "https://api.vk.com/method",
     authorize_url: "https://oauth.vk.com/authorize",
     token_url: "https://oauth.vk.com/access_token"]
  end

  # Public API

  def client do
    Application.get_env(:oauth2_example, VK)
    |> Keyword.merge(config())
    |> OAuth2.Client.new()
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], _headers \\ []) do
    OAuth2.Client.get_token!(client(), params)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end

  def get_user!(client) do
    {:ok, %{body: %{"response" => [user]}}} =  OAuth2.Client.get(client, "/users.get", [], params: [
        user_ids: client.token.other_params["user_id"], fields: "photo_200"
    ])
    %{name: "#{user["first_name"]} #{user["last_name"]}", avatar: user["photo_200"]}
  end
end
