defmodule UserApi do
  use Application

  def start(_type, _args) do
    UserApi.Supervisor.start_link
  end
end

