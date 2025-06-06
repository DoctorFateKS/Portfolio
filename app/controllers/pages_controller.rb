require 'net/http'
require 'json'

class PagesController < ApplicationController
  def home
    @projects = Project.all
    github_stats
  end

  def github_stats
    username = 'DoctorFateKS'
    token = ENV['GITHUB_TOKEN']

    uri = URI("https://api.github.com/graphql")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    query = <<-GRAPHQL
    query {
      user(login: "#{username}") {
        contributionsCollection {
          totalPullRequestContributions
          contributionCalendar {
            totalContributions
          }
        }
      }
    }
    GRAPHQL

    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{token}"
    request['Content-Type'] = 'application/json'
    request.body = { query: query }.to_json

    begin
    response = http.request(request)
    data = JSON.parse(response.body)
    puts "DEBUG GitHub API response: #{data.inspect}"

    if response.code.to_i == 200 && data["data"]
      @pr_count = data.dig("data", "user", "contributionsCollection", "totalPullRequestContributions") || 0
      @total_contributions = data.dig("data", "user", "contributionsCollection", "contributionCalendar", "totalContributions") || 0
    else
      # En cas d'erreur API, affiche zéro pour éviter crash
      @pr_count = 0
      @total_contributions = 0
      Rails.logger.error("GitHub API error: #{data['errors'] || response.body}")
    end
  rescue => e
    Rails.logger.error("Exception during GitHub API call: #{e.message}")
    @pr_count = 0
    @total_contributions = 0
  end
  end
end
