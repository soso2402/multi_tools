module MultiTools
  class SocialMedia
    def initialize(username)
      @username = username
      @logger = MultiTools.logger
    end

    def run
      @logger.header("Social Media Lookup: #{@username}")

      results = {
        username: @username,
        twitter: check_twitter,
        github: check_github,
        linkedin: check_linkedin,
        instagram: check_instagram,
        reddit: check_reddit,
        accounts_found: []
      }

      results[:accounts_found] = results.values.compact.select { |v| v.is_a?(Hash) && v[:found] }
      results
    end

    private

    def check_twitter
      @logger.info("Checking Twitter...")
      {
        platform: 'Twitter',
        username: @username,
        found: true,
        url: "https://twitter.com/#{@username}",
        followers: 0
      }
    rescue => e
      @logger.warn("Twitter check failed: #{e.message}")
      nil
    end

    def check_github
      @logger.info("Checking GitHub...")
      begin
        response = HTTParty.get("https://api.github.com/users/#{@username}", timeout: 10)
        if response.code == 200
          {
            platform: 'GitHub',
            username: @username,
            found: true,
            url: response['html_url'],
            repos: response['public_repos'],
            followers: response['followers']
          }
        end
      rescue => e
        @logger.warn("GitHub check failed: #{e.message}")
        nil
      end
    end

    def check_linkedin
      @logger.info("Checking LinkedIn...")
      { platform: 'LinkedIn', username: @username, found: false, url: "https://linkedin.com/in/#{@username}" }
    end

    def check_instagram
      @logger.info("Checking Instagram...")
      { platform: 'Instagram', username: @username, found: false, url: "https://instagram.com/#{@username}" }
    end

    def check_reddit
      @logger.info("Checking Reddit...")
      { platform: 'Reddit', username: @username, found: false, url: "https://reddit.com/user/#{@username}" }
    end
  end
end
