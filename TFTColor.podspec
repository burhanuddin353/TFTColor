#
# Be sure to run `pod lib lint TFTColor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TFTColor'
  s.version          = '1.0.0'
  s.summary          = 'A simple UIColor category to get color with hex code.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A simple UIColor library to get UIColor object from RGB hex string/value, CMYK hex string/value or CMYK base component values. You can also retrieve back RGB hex string/value, CMYK hex string/value.'

  s.homepage         = 'https://github.com/burhanuddin353/TFTColor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'burhanuddin353@gmail.com' => 'burhanuddin353@gmail.com' }
  s.source           = { :git => 'https://github.com/burhanuddin353/TFTColor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TFTColor/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TFTColor' => ['TFTColor/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
