# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/tim/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/tim/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g fish_key_bindings fish_vi_key_bindings

# NOTE: There is probably a sexier nicer way to do this, but until I figure that out I am manually unsetting here.
# Unsets PATH
set -g -x PATH

# This allows us to use Homebrew versions of things (like git) rather than the pre-installed or XCode installed versions.
# See http://blog.grayghostvisuals.com/git/how-to-keep-git-updated/ for reference.
set -g -x PATH $PATH /usr/local/bin

# Sets necessary PATH defaults
set -g -x PATH $PATH /usr/bin /bin /usr/sbin /sbin
