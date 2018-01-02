Pod::Spec.new do |s|  
  s.name             = "DDDCategory"  
  s.version          = "1.3.0"  
  s.summary          = "A categorys used on iOS."  
  s.homepage         = "https://github.com/393385724/DDCategoryDemo"  
  s.license          = 'MIT'  
  s.author           = { "llg" => "393385724@qq.com" }  
  s.source           = { :git => "https://github.com/393385724/DDCategoryDemo.git", :tag => s.version.to_s }  
  
  s.platform     = :ios, '8.0'  
  s.ios.deployment_target = '8.0'  
  s.requires_arc = true 
  # s.deprecated = true 
  
  s.subspec 'Runtime' do |runtime|
    runtime.source_files  = 'DDCategory/Runtime/*.{h,m}'
    runtime.frameworks    = 'Foundation', 'UIKit'
  end
  
  s.subspec 'Core' do |core|
    core.source_files  = 'DDCategory/Core/*.{h,m}'
    core.frameworks    = 'Foundation', 'UIKit'
    core.dependency 'DDDCategory/Runtime'
  end
  
  s.subspec 'Safety' do |safe|
    safe.source_files = 'DDCategory/Safety/*.{h,m}'
    safe.dependency 'DDDCategory/Runtime'
  end
  
  s.subspec 'Rotate' do |rotate|
    rotate.source_files = 'DDCategory/Rotate/*.{h,m}'
    rotate.dependency 'DDDCategory/Runtime'
  end
  
  s.subspec 'HitEdgeInsets' do |hit|
    hit.source_files = 'DDCategory/HitEdgeInsets/*.{h,m}'
  end
  
  s.subspec 'GestureConflict' do |gestureConflict|
    gestureConflict.source_files = 'DDCategory/GestureConflict/*.{h,m}'
  end
  
end  
