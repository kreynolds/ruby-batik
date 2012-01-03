require File.expand_path('spec_helper.rb', File.dirname(__FILE__))

describe "script execution" do
  it "should fail with invalid javascript" do
    transcoder = Batik::Transcoder.new
    svg = File.read(File.expand_path('svg_with_invalid_script.svg', File.dirname(__FILE__) + '/files'))
    expect {
      transcoder.to_png(svg, :execute_onload => true)
    }.to raise_error(NativeException)
  end

  it "should not fail with valid_javascript" do
    transcoder = Batik::Transcoder.new
    svg = File.read(File.expand_path('svg_with_valid_script.svg', File.dirname(__FILE__) + '/files'))
    expect {
      File.open("/tmp/foo.png", 'wb+') { |fp| fp.write(transcoder.to_png(svg, :execute_onload => true)) }
    }.to_not raise_error
  end

  it "should equal the prerendered test file" do
    transcoder = Batik::Transcoder.new
    svg = File.read(File.expand_path('svg_with_valid_script.svg', File.dirname(__FILE__) + '/files'))
    expect {
      transcoder.to_png(svg, :execute_onload => true).size.should eq(File.size(File.expand_path('svg_with_valid_script.png', File.dirname(__FILE__) + '/files')))
    }.to_not raise_error
  end
end