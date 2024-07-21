{pkgs, ...}: {
  
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    settings = {
      theme = "rose_pine";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
  };
}
