Pod::Spec.new do |spec|
  
  spec.name          = 'MUAppDelegate'
  spec.version       = '0.0.1'
  spec.license       = { :type => 'MIT' }
  spec.homepage      = 'https://github.com/MobileUpLLC/MUAppDelegate'
  spec.authors       = { 'Edgar Semko' => 'edgar.semko@mobileup.ru' }
  spec.summary       = 'MUAppDelegate'
  spec.source        = { :git => 'https://github.com/MobileUpLLC/MUAppDelegate.git', :tag => '0.0.1' }
  spec.module_name   = 'MUAppDelegate'
  spec.swift_version = '4.2'

  spec.ios.deployment_target  = '9.0'

  spec.source_files       = '*.swift'
  spec.ios.source_files   = '*.swift'

  spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'UIKit'

  spec.dependency 'Firebase/Core'
  spec.dependency 'Firebase/Messaging', '5.20.2'

end