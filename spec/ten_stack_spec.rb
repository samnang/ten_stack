require 'open3'
require 'spec_helper'

describe "Excuting Ten Stack" do
  it "displays top ten result from stackoverflow" do
    executable = File.expand_path("../../bin/ten_stack", __FILE__)
    output, _ = Open3.capture2e("#{executable} ruby")

    expect(output).to match(/title:/)
    expect(output).to match(/tags:/)
    expect(output).to match(/url:/)
  end
end
