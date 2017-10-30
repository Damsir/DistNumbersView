Pod::Spec.new do |s|

  s.name         = "DistNumbersView"
  s.version      = "1.0.0"
  s.summary      = "可冻结列的表格视图，类似Numbers(Mac)和Excel(Windows)"
  s.author       = { "Damrin" => "75081647@qq.com" }
  s.homepage    = 'https://github.com/Damsir/DistNumbersView'
  s.source      = { :git => 'https://github.com/Damsir/DistNumbersView.git', :tag => s.version }
  s.license = "MIT"
  s.platform = :ios, "8.0"
  s.requires_arc = true
  s.source_files = "DistNumbersView", "DistNumbersView/**/*.{h,m}"
  # s.public_header_files = "DistPopView/*.h"
  s.framework = 'UIKit'
  s.ios.deployment_target = "8.0"

end
