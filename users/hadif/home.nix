{ pkgs, ... }: {
    imports = [
        ../../home/core.nix
        ../../home/programs
        ../../home/shell
    ];

    programs.git = {
        userName = "Hadi Faraz";
        userEmail = "hadifaraz52@proton.me";
    };
}
