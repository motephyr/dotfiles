require 'fileutils'
Dir.glob("#{Dir.home}/dotfiles/zsh_configs/*").each do |file|
    FileUtils.ln_s file, "#{Dir.home}/.#{File.basename(file)}"
end
