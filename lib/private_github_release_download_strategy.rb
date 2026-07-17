# frozen_string_literal: true

require "download_strategy"
require "utils/github/api"

class PrivateGitHubReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    token = GitHub::API.credentials
    if token.present?
      meta[:headers] ||= []
      meta[:headers] += [
        "Accept: application/octet-stream",
        "Authorization: token #{token}",
        "X-GitHub-Api-Version: 2022-11-28",
      ]
    end

    super
  end
end
