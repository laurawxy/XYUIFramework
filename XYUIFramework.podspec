Pod::Spec.new do |s|
s.name         = "XYUIFramework"
s.version      = "0.0.103"
s.summary      = "XYUIFramework"
s.homepage     = "https://github.com/laurawxy/XYUIFramework"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.authors      = {"Xiangyu Wang" => "xiangyu.laura@icloud.com"}
s.platform     = :ios, "8.0"
s.source       = {:git => "https://github.com/laurawxy/XYUIFramework.git", :tag => "#{s.version}"}
s.source_files = "XYUIFramework/**/*.{h,m}"

s.requires_arc = true

s.dependency 'Masonry'
s.dependency 'AFNetworking'
s.dependency 'MJRefresh'
s.dependency "MJExtension"
s.dependency "IQKeyboardManager"
s.dependency "SDWebImage"
s.dependency "SVProgressHUD"
s.dependency "YYCache"
s.dependency "LKDBHelper"

end
