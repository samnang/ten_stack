require 'spec_helper'

describe "Ten Stack" do
  let(:client) {
    TenStack.configure do |c|
      c.domain = "stackoverflow.com"
    end
  }

  it "returns top ten questions from stack overflow by tag" do
    VCR.use_cassette("top 10 ruby results") do
      questions = client.top_10_questions_by_tag("Ruby")

      expect(questions.count).to eql(10)
    end
  end

  it 'returns questions that tagged with Ruby' do
    VCR.use_cassette("top 10 ruby results") do
      questions = client.top_10_questions_by_tag("Ruby")

      expect(questions.first["tags"]).to include("ruby")
      expect(questions.last["tags"]).to include("ruby")
    end
  end


  it 'configures keys' do
    expect(client.domain).to eql("stackoverflow.com")
  end
end

