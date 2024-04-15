module Pkg::Sign::Ips
  module_function

  def sign(ips_dir = 'pkg')
    packages = Dir["#{ips_dir}/**/*.p5p"]
    return if packages.empty?

    Pkg::Util::Gpg.load_keychain if Pkg::Util::Tool.find_tool('keychain')
    packages.each do |p5p_package|
      Pkg::Util::Gpg.sign_file(p5p_package)
    end
  end
end
