#
# Fonts
#
AddPackage --foreign fonts-meta-base
AddPackage --foreign fonts-meta-extended-lt
AddPackage noto-fonts # Google Noto TTF fonts
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage otf-fira-sans # Mozilla's sans-serif typeface designed for Firefox OS
AddPackage otf-font-awesome-5
AddPackage otf-overpass # An open source font family inspired by Highway Gothic esp. suited for signs, lettering and web sites
AddPackage tex-gyre-fonts # Substitute PostScript fonts in OpenType format
AddPackage ttc-iosevka # Typeface family designed for coding, terminal use and technical documents.
AddPackage ttf-caladea # Google's Caladea font
AddPackage ttf-carlito # Google's Carlito font
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage ttf-iosevka-nerd # Typeface family designed for coding, terminal use and technical documents (Nerd Fonts)
AddPackage ttf-liberation # Red Hats Liberation fonts
AddPackage ttf-roboto # Google's signature family of fonts
AddPackage --foreign ttf-courier-prime # Monospace Courier font alternative optimized for screenplays
AddPackage --foreign ttf-gelasio-ib # Gelasio is designed to be metrics compatible with Georgia in its Regular, Bold, Italic and Bold Italic weights. Interpolated Medium, medium Italic, SemiBold and SemiBold Italic have now been added as well.
AddPackage --foreign ttf-merriweather # A typeface that is pleasant to read on screens by Sorkin Type Co
AddPackage --foreign ttf-signika # Sans-serif typeface from Google by Anna Giedryś

CreateLink /etc/fonts/conf.d/10-hinting-slight.conf /usr/share/fontconfig/conf.default/10-hinting-slight.conf
CreateLink /etc/fonts/conf.d/10-scale-bitmap-fonts.conf /usr/share/fontconfig/conf.default/10-scale-bitmap-fonts.conf
CreateLink /etc/fonts/conf.d/10-sub-pixel-rgb.conf /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf
CreateLink /etc/fonts/conf.d/11-lcdfilter-default.conf /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-lgc-sans-mono.conf /usr/share/fontconfig/conf.default/20-unhint-small-dejavu-lgc-sans-mono.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-lgc-sans.conf /usr/share/fontconfig/conf.default/20-unhint-small-dejavu-lgc-sans.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-lgc-serif.conf /usr/share/fontconfig/conf.default/20-unhint-small-dejavu-lgc-serif.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-sans-mono.conf /usr/share/fontconfig/conf.default/20-unhint-small-dejavu-sans-mono.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-sans.conf /usr/share/fontconfig/conf.default/20-unhint-small-dejavu-sans.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-serif.conf /usr/share/fontconfig/conf.default/20-unhint-small-dejavu-serif.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-vera.conf /usr/share/fontconfig/conf.default/20-unhint-small-vera.conf
CreateLink /etc/fonts/conf.d/30-metric-aliases.conf /usr/share/fontconfig/conf.default/30-metric-aliases.conf
CreateLink /etc/fonts/conf.d/40-nonlatin.conf /usr/share/fontconfig/conf.default/40-nonlatin.conf
CreateLink /etc/fonts/conf.d/45-generic.conf /usr/share/fontconfig/conf.default/45-generic.conf
CreateLink /etc/fonts/conf.d/45-latin.conf /usr/share/fontconfig/conf.default/45-latin.conf
CreateLink /etc/fonts/conf.d/46-noto-mono.conf /usr/share/fontconfig/conf.default/46-noto-mono.conf
CreateLink /etc/fonts/conf.d/46-noto-sans.conf /usr/share/fontconfig/conf.default/46-noto-sans.conf
CreateLink /etc/fonts/conf.d/46-noto-serif.conf /usr/share/fontconfig/conf.default/46-noto-serif.conf
CreateLink /etc/fonts/conf.d/49-sansserif.conf /usr/share/fontconfig/conf.default/49-sansserif.conf
CreateLink /etc/fonts/conf.d/50-user.conf /usr/share/fontconfig/conf.default/50-user.conf
CreateLink /etc/fonts/conf.d/51-local.conf /usr/share/fontconfig/conf.default/51-local.conf
CreateLink /etc/fonts/conf.d/57-dejavu-sans-mono.conf /usr/share/fontconfig/conf.default/57-dejavu-sans-mono.conf
CreateLink /etc/fonts/conf.d/57-dejavu-sans.conf /usr/share/fontconfig/conf.default/57-dejavu-sans.conf
CreateLink /etc/fonts/conf.d/57-dejavu-serif.conf /usr/share/fontconfig/conf.default/57-dejavu-serif.conf
CreateLink /etc/fonts/conf.d/58-dejavu-lgc-sans-mono.conf /usr/share/fontconfig/conf.default/58-dejavu-lgc-sans-mono.conf
CreateLink /etc/fonts/conf.d/58-dejavu-lgc-sans.conf /usr/share/fontconfig/conf.default/58-dejavu-lgc-sans.conf
CreateLink /etc/fonts/conf.d/58-dejavu-lgc-serif.conf /usr/share/fontconfig/conf.default/58-dejavu-lgc-serif.conf
CreateLink /etc/fonts/conf.d/60-generic.conf /usr/share/fontconfig/conf.default/60-generic.conf
CreateLink /etc/fonts/conf.d/60-latin.conf /usr/share/fontconfig/conf.default/60-latin.conf
CreateLink /etc/fonts/conf.d/62-caladea.conf /usr/share/fontconfig/conf.default/62-caladea.conf
CreateLink /etc/fonts/conf.d/62-google-crosextra-carlito.conf /usr/share/fontconfig/conf.default/62-google-crosextra-carlito.conf
CreateLink /etc/fonts/conf.d/65-droid-kufi.conf /usr/share/fontconfig/conf.default/65-droid-kufi.conf
CreateLink /etc/fonts/conf.d/65-droid-sans-mono.conf /usr/share/fontconfig/conf.default/65-droid-sans-mono.conf
CreateLink /etc/fonts/conf.d/65-droid-sans.conf /usr/share/fontconfig/conf.default/65-droid-sans.conf
CreateLink /etc/fonts/conf.d/65-droid-serif.conf /usr/share/fontconfig/conf.default/65-droid-serif.conf
CreateLink /etc/fonts/conf.d/65-fonts-persian.conf /usr/share/fontconfig/conf.default/65-fonts-persian.conf
CreateLink /etc/fonts/conf.d/65-nonlatin.conf /usr/share/fontconfig/conf.default/65-nonlatin.conf
CreateLink /etc/fonts/conf.d/66-noto-mono.conf /usr/share/fontconfig/conf.default/66-noto-mono.conf
CreateLink /etc/fonts/conf.d/66-noto-sans.conf /usr/share/fontconfig/conf.default/66-noto-sans.conf
CreateLink /etc/fonts/conf.d/66-noto-serif.conf /usr/share/fontconfig/conf.default/66-noto-serif.conf
CreateLink /etc/fonts/conf.d/69-unifont.conf /usr/share/fontconfig/conf.default/69-unifont.conf
CreateLink /etc/fonts/conf.d/69-urw-bookman.conf /usr/share/fontconfig/conf.default/69-urw-bookman.conf
CreateLink /etc/fonts/conf.d/69-urw-c059.conf /usr/share/fontconfig/conf.default/69-urw-c059.conf
CreateLink /etc/fonts/conf.d/69-urw-d050000l.conf /usr/share/fontconfig/conf.default/69-urw-d050000l.conf
CreateLink /etc/fonts/conf.d/69-urw-fallback-backwards.conf /usr/share/fontconfig/conf.default/69-urw-fallback-backwards.conf
CreateLink /etc/fonts/conf.d/69-urw-fallback-generics.conf /usr/share/fontconfig/conf.default/69-urw-fallback-generics.conf
CreateLink /etc/fonts/conf.d/69-urw-fallback-specifics.conf /usr/share/fontconfig/conf.default/69-urw-fallback-specifics.conf
CreateLink /etc/fonts/conf.d/69-urw-gothic.conf /usr/share/fontconfig/conf.default/69-urw-gothic.conf
CreateLink /etc/fonts/conf.d/69-urw-nimbus-mono-ps.conf /usr/share/fontconfig/conf.default/69-urw-nimbus-mono-ps.conf
CreateLink /etc/fonts/conf.d/69-urw-nimbus-roman.conf /usr/share/fontconfig/conf.default/69-urw-nimbus-roman.conf
CreateLink /etc/fonts/conf.d/69-urw-nimbus-sans.conf /usr/share/fontconfig/conf.default/69-urw-nimbus-sans.conf
CreateLink /etc/fonts/conf.d/69-urw-p052.conf /usr/share/fontconfig/conf.default/69-urw-p052.conf
CreateLink /etc/fonts/conf.d/69-urw-standard-symbols-ps.conf /usr/share/fontconfig/conf.default/69-urw-standard-symbols-ps.conf
CreateLink /etc/fonts/conf.d/69-urw-z003.conf /usr/share/fontconfig/conf.default/69-urw-z003.conf
CreateLink /etc/fonts/conf.d/80-delicious.conf /usr/share/fontconfig/conf.default/80-delicious.conf
CreateLink /etc/fonts/conf.d/81-ubuntu.conf /usr/share/fontconfig/conf.default/81-ubuntu.conf
CreateLink /etc/fonts/conf.d/90-synthetic.conf /usr/share/fontconfig/conf.default/90-synthetic.conf
