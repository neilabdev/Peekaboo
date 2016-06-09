#
# Be sure to run `pod lib lint Peekaboo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "Peekaboo"
  s.version = "1.0.3"
  s.summary = "Peekaboo is an iOS API which allows you easily use a ScrollView to automatically hide the navigation and toolbar."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description = <<-DESC
  Peekaboo is an iOS API which allows you easily use a UIScrollView to automatically hide the navigation and toolbar or
other UIViews you configure using optional delegate methods.
  DESC

  s.homepage = "https://github.com/valerius/Peekaboo"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license = 'MIT'
  s.author = {"James Whitfield" => "valerius@neilab.com"}
  s.source = {:git => "https://github.com/valerius/Peekaboo.git", :tag => s.version.to_s}
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.private_header_files = 'Pod/Classes/**/*Private.h'
end
