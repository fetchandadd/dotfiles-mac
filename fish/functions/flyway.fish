function flyway
  docker run -it --rm --net host -v "$PWD":/migrations creios/flyway $argv
end
