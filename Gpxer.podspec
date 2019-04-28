#
# Be sure to run `pod lib lint Gpxer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Gpxer'
  s.version          = '0.1.0'
  s.summary          = 'Gpxer is a small library for reading/writing GPX files.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Gpxer is a small library for reading/writing GPX files. This pod will be able to help developers parse and create GPX files more easily. More features will be added to the future.
                       DESC

  s.homepage         = 'https://github.com/luan-ma/Gpxer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luan-ma' => 'luan.ma@163.com' }
  s.source           = { :git => 'https://github.com/luan-ma/Gpxer.git', :tag => s.version.to_s }
  s.module_name      = 'Gpxer'
  s.swift_version    = '4.2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Gpxer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Gpxer' => ['Gpxer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SwiftyXML', '~> 2.0'
end
