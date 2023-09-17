# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module LogFormatter
  def self.format_log
    # URIをパース
    uri = URI.parse('https://samples.jnito.com/access-log.json')
    # JSON文字列を取得
    json = Net::HTTP.get(uri)
    # 取得したJSON文字列をパースしてRubyのオブジェクトに変換
    # これでハッシュを要素とする配列を得る
    log_data = JSON.parse(json, symbolize_names: true)
    # pp log_data

    log_data.map do |log|
      # p log
      case log
      in {request_id:, path:, status: 404 | 500 => status, error:}
        "[ERROR] request_id=#{request_id}, path=#{path}, status=#{status}, error=#{error}"
      in {request_id:, path:, duration: 1000.. => duration}
        "[WARN] request_id=#{request_id}, path=#{path}, duration=#{duration}"
      in {request_id:, path:}
        "[OK] request_id=#{request_id}, path=#{path}"
      end
    end.join("\n")
  end
end
