module TenStack
  class Client
    attr_accessor :domain

    def top_10_questions_by_tag(tag)
      response = make_request(tag)
      parse_response(response)
    end

    private

    def make_request(tag)
      request = Typhoeus::Request.new("http://api.#{domain}/1.1/questions?tagged=#{tag}&pagesize=10")
      request.on_complete do |response|
        if response.success?
          return response
        else
          raise "API temporary unavailable!"
        end
      end
      request.run
    end

    def parse_response(response)
      body = StringIO.new(response.body)
      payload = Zlib::GzipReader.new(body).read
      questions = JSON.parse(payload)["questions"]

      questions.each do |q|
        q["question_url"] = "http://#{domain}/questions/#{q["question_id"]}"
      end
    end
  end
end

