#/bin/env ruby

if ARGV[0]
  target = "#{ARGV[0]}.pkgs"
else
  target = "*"
end

system("pacaur -S --noconfirm --noedit --needed $(cat aur/#{target})", out: $stdout, err: $stderr)
