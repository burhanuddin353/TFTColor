Pod::Spec.new do |s|
  s.name             = 'TFTColor'
  s.version          = '1.0.0'
  s.summary          = 'A simple UIColor category to get color with hex code.'
  s.homepage         = 'https://github.com/burhanuddin353/TFTColor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Burhanuddin Sunelwala' => 'burhanuddin353@gmail.com' }
  s.source           = { :git => 'https://github.com/burhanuddin353/TFTColor.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/burhanuddin353'

  s.ios.deployment_target = '8.0'
  s.source_files = 'TFTColor/*.swift'
end
