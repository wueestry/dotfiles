{pkgs, ...}: {
    home.username = "ryan";
    home.homeDirectory = "/home/ryan";    
    home.stateVersion = "25.05"; # Comment out for error with "latest" version
    programs.home-manager.enable = true;

    home.packages = ( with pkgs; [
    	atuin
	eza
	lazygit
	starship
    ]);
}
