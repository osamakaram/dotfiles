# modules/mas.nix
# Configuration for Mac App Store applications
{ config, pkgs, lib, ... }:

{
  # Mac App Store configuration
  # This depends on the 'mas' CLI tool being installed via Homebrew
  homebrew.masApps = {
    # Productivity
    "Amphetamine" = 937984704;
    "CalcService" = 899970159;
    "CrystalFetch" = 6454431289;
    "Dropover" = 1355679052;
    "Magnet" = 441258766;
    "Menu Bar Calendar" = 1558360383;
    "Microsoft 365" = 1475226241;
    "Notion Web Clipper" = 1559269364;
    "PDFgear" = 6469021132;
    "Perplexity" = 6714467650;
    "Playgrounds" = 1496833156;
    "Pure Paste" = 1611378436;
    "Record Go" = 6474534754;
    "Recordia" = 1529006487;
    "Shareful" = 1522267256;
    "Today" = 6443714928;
    "Velja" = 1607635845;
    "WordService" = 899972312;
    "XMenu" = 419332741;
    
    # Media and Entertainment
    "Emby" = 992180193;
    "Prime Video" = 545519333;
    
    # Utilities and Tools
    "DeArrow" = 6451469297;
    "Fasten Health" = 6471036301;
    "Home Assistant" = 1099568401;
    "HP Smart" = 1474276998;
    "Hush" = 1544743900;
    "Kiano" = 1413833786;
    "Refined GitHub" = 1519867270;
    "Save to Raindrop.io" = 1549370672;
    "SocialFocus" = 1661093205;
    "SponsorBlock" = 1573461917;
    "Surfed" = 1591590700;
    "UnTrap" = 1637438059;
    "Windows App" = 1295203466;
    
    # Security and Privacy
    "KeepSolid VPN Unlimited" = 694633015;
    "Wayback Machine" = 1472432422;
    "WireGuard" = 1451685025;

    # Uncomment to enable more applications
    # "Actions" = 1586435171;
    # "Aiko" = 1672085276;
    # "Amazing AI" = 1660147028;
    # "Color Picker" = 1545870783;
    # "Command X" = 6448461551;
    # "Copilot" = 1447330651;
    # "CurrentKey Stats" = 1456226992;
    # "Daily" = 6667115472;
    # "Day Progress" = 6450280202;
    # "Encrypto" = 935235287;
    # "Folder Peek" = 1615988943;
    # "Folder Preview" = 6698876601;
    # "Ghostery Privacy Ad Blocker" = 6504861501;
    # "Gifski" = 1351639930;
    # "Gladys" = 1382386877;
    # "Hand Mirror" = 1502839586;
    # "HEIC Converter" = 1294126402;
    # "Hidden Bar" = 1452453066;
    # "Hyperduck" = 6444667067;
    # "Icon Preview" = 6480373509;
    # "Internet Access Policy Viewer" = 1482630322;
    # "Jami" = 1388475331;
    # "JuxtaText" = 6504801865;
    # "LocalSend" = 1661733229;
    # "Lockdown" = 1483255076;
    # "Mima" = 1667149683;
    # "My Applications" = 1630766571;
    # "Notenik" = 1465997984;
    # "One Thing" = 1604176982;
    # "Ooooo" = 1482773008;
    # "Pandan" = 1569600264;
    # "Pasteboard" = 1499215709;
    # "PayPal Honey" = 1472777122;
    # "PDF Converter" = 6465168879;
    # "PhotoStickies" = 447313635;
    # "Plain Text Editor" = 1572202501;
    # "Plash" = 1494023538;
    # "Randa" = 1589044499;
    # "Second Clock" = 6450279539;
    # "Shortery" = 1594183810;
    # "Spaced" = 1666327168;
    # "Speediness" = 1596706466;
    # "Sprinkles-Mod-the-Web" = 1500209074;
    # "Userscripts" = 1463298887;
    # "UTC Time" = 1538245904;
    # "VPN Unlimited" = 727593140;
    # "Week Number" = 6502579523;
  };
} 