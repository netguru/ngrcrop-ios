#
#  Be sure to run `pod spec lint NGRCrop.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "NGRCrop"
  s.version      = "0.0.1"
  s.summary      = "Pod for Cropping images."

  s.description  = <<-DESC
                   UI component for editing selected photos. Enable scaling, rotating croping images.
                   DESC

  s.homepage     = "http://EXAMPLE/NGRCrop"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = { :type => "MIT license", :file => "https://github.com/netguru/ngrcrop-ios/blob/master/LICENSE.md" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { 
    "marcinpiesiak" => "marcin.piesiak@gmail.com",
    "akashivskyy" => "adrian.kashivskyy@netguru.pl",
    "PatrykKaczmarek" => "patryk.kaczmarek@netguru.pl",
    "WojciechTrzasko" => "wojciech.trzasko@netguru.pl",
    "glesiak" => "grzegorz.lesiak@netguru.pl",
    "ecler" => "pawel.bialecki@netguru.pl"
  }
 
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.platform     = :ios

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/netguru/ngrcrop-ios.git", :tag => "0.0.1" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "Classes", "NGRCrop/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
