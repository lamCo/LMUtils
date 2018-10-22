

Pod::Spec.new do |s|

  s.name         = "LMUtils"
  s.version      = "0.0.6"
  s.summary      = "日常使用分类库。"
  s.homepage     = "https://github.com/lamCo/LMUtils"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.author       = { "lam" => "a253143598@qq.com" }
  s.source       = { :git => "https://github.com/lamCo/LMUtils.git", :tag => "#{s.version}" }
  # s.source_files  = "Classes", "LMUtilsDemo/LMUtilsDemo/LMUtils/**/*.{h,m}"
  # 主文件夹目录
  s.source_files  = "LMUtilsDemo/LMUtilsDemo/LMUtils/**"

  #子文件夹目录
  s.subspec 'Foundation' do |foundation|
  	foundation.source_files =  "LMUtilsDemo/LMUtilsDemo/LMUtils/Foundation/*.{h,m}"
  end
#子文件夹目录
  s.subspec 'Kit' do |kit|
  	kit.source_files =  "LMUtilsDemo/LMUtilsDemo/LMUtils/Kit/*.{h,m}"
  end

	s.frameworks ='Foundation', 'UIKit'
end
