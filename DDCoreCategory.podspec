Pod::Spec.new do |s|  
  s.name             = "DDCoreCategory"  
  s.version          = "1.2.0"  
  s.summary          = "A categorys used on iOS."  
  s.homepage         = "https://github.com/393385724/DDCategoryDemo"  
  s.license          = 'MIT'  
  s.author           = { "llg" => "393385724@qq.com" }  
  s.source           = { :git => "https://github.com/393385724/DDCategoryDemo.git", :tag => s.version.to_s }  
  
  s.platform     = :ios, '8.0'  
  s.ios.deployment_target = '8.0'  
  s.requires_arc = true  
  
  s.subspec 'Core' do |core|
    core.source_files  = 'DDCoreCategory/Core/*.{h,m}'
    core.frameworks    = 'Foundation', 'UIKit'
  end
  
  s.subspec 'HitEdgeInsets' do |hit|
    hit.source_files = 'DDCoreCategory/HitEdgeInsets/*.{h,m}'
    hit.dependency 'DDCoreCategory/Core'
  end
  
  s.subspec 'Safety' do |safe|
    safe.source_files = 'DDCoreCategory/Safety/*.{h,m}'
    safe.dependency 'DDCoreCategory/Core'
  end
  
  s.subspec 'Rotate' do |rotate|
    rotate.source_files = 'DDCoreCategory/Rotate/*.{h,m}'
    rotate.dependency 'DDCoreCategory/Core'
  end
  
end  
