{ ... }:

{
  users.users.borg = {
    isNormalUser = true;
    description = "Backup user";
    openssh.authorizedKeys.keys = [
    ];
    createHome = true;
    extraGroups = [
    ];
  };
  services.borgbackup = {
    jobs =
      let
        common-excludes = [
          ".cache"
        ];
        borgJob = name: {
          encryption.mode = "none";
          environment = {
            BORG_SSH = "ssh -o 'StrictHostKeyChecking=no' -i /home/borg/.ssh/id_ed25519";
            BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
          };
          extraCreateArgs = "--verbose --stats --checkpoint-interval 600";
          repo = "ssh://borg@isakssonsmetall.hopto.org:2424//berlin/backups/borg/${name}";
          compression = "zstd,1";
          startAt = "02:00";
          user = "borg";
        };
      in
      {
        meitner = borgJob "meitner" // {
          paths = "/data/backups/meitner";
        };
        chandrasekhar = borgJob "chandrasekhar" // {
          paths = "/data/backups/chandrasekhar";
        };
        #ancilla = borgJob "ancilla" // rec {
        #  paths = ""
        #}
        sharedFolders = borgJob "shared" // {
          paths = "/data/shared";
        };
      };
  };
}
