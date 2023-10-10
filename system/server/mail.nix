{ inputs, ...}: {
  imports = [
    inputs.simple-nixos-mailserver.nixosModule
  ];
  
  mailserver = {
    enable = true;
    
    fqdn = "mail.clrcera.ddns.net";
    domains = [ "clrcera.ddns.net" ];
    
    loginAccounts = {
      "clr@clrcera.ddns.net" = {
        hashedPasswordFile = "/a/file/containing/a/hashed/password";
      };
    };
    certificateScheme = "acme-nginx";
  };
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "security@clrcera.ddns.net";
}
