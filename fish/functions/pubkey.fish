function pubkey
  pbcopy < ~/.ssh/id_rsa.pub
  echo "Public key copied to clipboard..."
end
