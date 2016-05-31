Pod::Spec.new do |s|  
  s.name             = "DDCoreCategory"  
  s.version          = "1.0.0"  
  s.summary          = "A categorys used on iOS."  
  s.homepage         = "https://github.com/393385724/DDCategoryDemo"  
  s.license          = 'MIT'  
  s.author           = { "llg" => "393385724@qq.com" }  
  s.source           = { :git => "https://github.com/393385724/DDCategoryDemo.git", :tag => s.version.to_s }  
  
  s.platform     = :ios, '7.0'  
  s.ios.deployment_target = '7.0'  
  s.requires_arc = true  
  
  s.source_files = 'DDCoreCategory/*.{m,h}'  
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  s.dependency 'SSKeychain', '~> 1.2.3'
end  
