# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/tim/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/tim/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g fish_key_bindings fish_vi_key_bindings
