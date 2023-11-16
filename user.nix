{ pkgs, misc, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
  programs.git.aliases = {
    ci = "commit";
    co = "checkout";
    create-pull-request = "!sh - c 'stash pull-request $0'";
    lg = "!git lg1";
    lg1 = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    lg2 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
    lg3 = "log - -pretty=format:\"%h%x09%an%x09%ad%x09%s\"";
    meld = "!f() { git difftool -d  $1 $2; }; f";
    p = "pull";
    pr = "!sh -c 'stash-browse -p $0'";
    rb = "!f() { git fetch origin \"$1\" && git rebase FETCH_HEAD;}; f";
    recentwork = "log - -no-merges - -committer matthias.eliasson";
    st = "status";
    sync = "!git pull && sync_server";
    trackpush = "!git push --set-upstream origin `git symbolic-ref --short HEAD`";
  };
  programs.git.delta.options = {
    file-decoration-style = "yellow ul";
    file-style = "yellow italic";
    hunk-header-decoration-style = "omit";
    hunk-header-style = "syntax bold";
    line-numbers = true;
    line-numbers-left-format = "{nm:^4} ";
    line-numbers-right-format = "{np:^4} ";
    line-numbers-zero-style = "#4b5263";
    minus-emph-style = "syntax #600818";
    minus-style = "syntax #450a15";
    navigate = true;
    plus-emph-style = "syntax #175c2e";
    plus-style = "syntax #0b4820";
    syntax-theme = "Solarized (dark)";
    width = 1;
  };
  programs.git.extraConfig = {
    credential = {
      helper = "cache --timeout 3600";
    };
    core = {
      excludesfile = "/home/curantes/.gitignore";
    };
    diff = {
      colorMoved = "default";
    };
    merge = {
      conflictstyle = "diff3";
    };
    pull = {
      rebase = true;
    };
    push = {
      default = "simple";
    };
    web = {
      browser = "google-chrome-stable";
    };
  };
  programs.neovim = {
    defaultEditor = true;
    extraConfig = lib.fileContents ~/git/jonaz-dotfiles/nvim/init.vim;
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      vimPlugins.nvim-treesitter
    ];
    viAlias = true;
    vimAlias = true;
  };
}
