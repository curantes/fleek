{ pkgs, misc, config, lib, ... }:
let
  # ...
  nixgl = import <nixgl> { };
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" { } ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${lib.getExe nixgl.auto.nixGLDefault} $bin \$@" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
in
{
  # This file will never be modified by fleek
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors
  # home manager options available here: https://nix-community.github.io/home-manager/options.html

  home.packages = [
    (nixGLWrap pkgs.alacritty)
  ];
}
#   # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
#   programs.alacritty.settings = {
# window = {
# "dynamic_title" = true;
# padding = { x = 2; y = 2; };
# "dynamic_padding" = true;
# };
# colors = {
# primary = {
# background = "#002b36";
# foreground = "#839496";
# };
# cursor = {
# text = "#002b36";
# cursor = "#839496";
# };
# normal = {
# black = "#073642";
# red = "#dc322f";
# green = "#859900";
# yellow = "#b58900";
# blue = "#268bd2";
# magenta = "#d33682";
# cyan = "#2aa198";
# white = "#eee8d5";
# };
# bright = {
# black = "#002b36";
# red = "#cb4b16";
# green = "#586e75";
# yellow = "#657b83";
# blue = "#839496";
# magenta = "#6c71c4";
# cyan = "#93a1a1";
# white = "#fdf6e3";
# };
# };
# selection = {
# "semantic_escape_chars" = ",│`|:\"' ()[]{}<>  ";
# "save_to_clipboard" = true;
# };
# font = {
# offset = {
# x = -1;
# y = -1;
# };
# normal = {
# family = "Hack";
# style = "Regular";
# };
# bold = {
# family = "Hack";
# style = "Bold";
# };
# italic = {
# family = "Hack";
# style = "Italic";
# };
# "bold_italic" = {
# family = "Hack";
# style = "Bold Italic";
# };
# };
# scrolling = {
# history = 10000;
# };
# };
# programs.helix.defaultEditor = true;
# programs.helix.settings = {
# theme = "solarized_dark";
# };
# }
