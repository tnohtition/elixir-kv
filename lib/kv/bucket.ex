defmodule KV.Bucket do
  use Agent

  @doc """
  Start new bucket
  """
  def start_link _otps do
    Agent.start_link fn -> %{} end
  end

  @doc """
  Get new value from bucket by key
  """
  def get bucket, key do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Put the value for givin key in bucket
  """
  def put bucket, key, value do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes the `key` from `bucket`

  Return the current value of `key`, if `key` exists
  """
  def delete bucket, key do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
