# frozen_string_literal: true

require "download_strategy"
require "utils/github/api"

class PrivateGitHubReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    token = GitHub::API.credentials
    if token.blank?
      raise CurlDownloadStrategyError.new(
        url,
        "This package is stored in a private GitHub repository. Run `gh auth login` and try again.",
      )
    end

    meta[:headers] ||= []
    meta[:headers] += [
      "Accept: application/octet-stream",
      "Authorization: token #{token}",
      "X-GitHub-Api-Version: 2022-11-28",
    ]
    super
  end
end
