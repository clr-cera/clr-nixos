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
        hashedPasswordFile = "/mail/clrPassword";
      };
    };
    certificateScheme = "acme-nginx";
  };
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "security@clrcera.ddns.net";
}
