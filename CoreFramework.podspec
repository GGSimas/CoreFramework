Pod::Spec.new do |spec|
  spec.name                 = "CoreFramework"
  spec.version              = "1.0.0"
  spec.summary              = "CoreFramework foi desenvolvido para atender ao app Reminder"
  spec.description          = <<-DESC
                   Esse projeto tem o intuito de prover componentes e algumas features como o onboarding do app Reminder
  DESC
  spec.homepage              = "http://github.com/GGSimas/CoreFramework"
  spec.license               = { :type => "MIT", :file => "LICENSE" }
  spec.author                = { "Gabriel Simões" => "simoes.gabrielm@gmail.com" }
  spec.platform              = :ios, "12.0"
  spec.swift_versions        = ["5.0"]
  spec.ios.deployment_target = "12.0"
  spec.source                = { :git => "https://github.com/GGSimas/CoreFramework.git", :tag => "#{spec.version}" }
  spec.source_files          = "CoreFramework/Sources/**/*.{swift}"
  spec.exclude_files         = "Classes/Exclude"
  spec.framework             = "UIKit"
end
