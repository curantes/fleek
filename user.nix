{ pkgs, misc, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
  programs.git.aliases = {
    create-pull-request = "!sh - c 'stash pull-request $0'";
    pr = "!sh -c 'stash-browse -p $0'";
    lg1 = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    lg2 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
    lg = "!git lg1";
    lg3 = "log - -pretty=format:\"%h%x09%an%x09%ad%x09%s\"";
    meld = "!f() { git difftool -d  $1 $2; }; f";
    st = "status";
    ci = "commit";
    co = "checkout";
    p = "pull";
    recentwork = "log - -no-merges - -committer matthias.eliasson";
    trackpush = "!git push --set-upstream origin `git symbolic-ref --short HEAD`";
    sync = "!git pull && sync_server";
    rb = "!f() { git fetch origin \"$1\" && git rebase FETCH_HEAD;}; f";
  };
  programs.helix.defaultEditor = true;
  programs.helix.settings = {
    theme = "solarized_dark";
  };
}
