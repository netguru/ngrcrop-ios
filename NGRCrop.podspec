#
#  ngrcrop-ios.podspec
#
#  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
#
Pod::Spec.new do |spec|

  spec.name         = 'NGRCrop'
  spec.version      = '0.0.1'
  spec.homepage     = 'https://github.com/netguru/ngrcrop-ios/'
  spec.source        = { :git => 'https://github.com/netguru/ngrcrop-ios.git', :tag => spec.version.to_s }
  spec.summary      = 'Pod for Cropping images.'
  spec.license      = { :type => 'MIT', :file => 'LICENSE.md' }

  spec.authors     = { 'marcinpiesiak' => 'marcin.piesiak@gmail.com',
                       'akashivskyy' => 'adrian.kashivskyy@netguru.pl',
                       'PatrykKaczmarek' => 'patryk.kaczmarek@netguru.pl',
  }
 
  spec.platform     = :ios, '7.0'
  spec.source       = { :git => 'https://github.com/netguru/ngrcrop-ios.git', :tag => '0.0.1' }

  spec.source_files = 'NGRCrop/**/*.{h,m}'
  spec.requires_arc = true

end
