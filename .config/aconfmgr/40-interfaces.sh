#
# Network
#
AddPackage networkmanager
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service


#
# Audio / Video
#
AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
CreateLink /etc/systemd/user/pipewire.service.wants/pipewire-media-session.service /usr/lib/systemd/user/pipewire-media-session.service
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
AddPackage pamixer # Pulseaudio command-line mixer like amixer
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
AddPackage pavucontrol # PulseAudio Volume Control
