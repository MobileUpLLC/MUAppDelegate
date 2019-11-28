Pod::Spec.new do |spec|
  
  spec.name          = 'MUAppDelegate'
  spec.version       = '0.0.1'
  spec.license       = { :type => 'MIT' }
  spec.homepage      = 'https://github.com/MobileUpLLC/MUAppDelegate'
  spec.authors       = { 'Edgar Semko' => 'edgar.semko@mobileup.ru' }
  spec.summary       = ''
  spec.source        = { :git => 'https://github.com/MobileUpLLC/MUAppDelegate.git', :tag => 'v0.0.1' }
  spec.module_name   = 'MUAppDelegate'
  spec.swift_version = '4.2'

  spec.ios.deployment_target  = '9.0'

  spec.source_files       = '*.swift'
  spec.ios.source_files   = '*.swift'

  spec.framework      = 'SystemConfiguration'
  spec.ios.framework  = 'UIKit'

end