function sniff
  sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'
end
