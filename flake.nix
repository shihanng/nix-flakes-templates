{
  description = "A collection of Nix Flakes templates for software development";

  outputs = { self }: {
    templates = {
      python = {
        path = ./python;
        description = "Python development environment";
      };

      nodejs = {
        path = ./nodejs;
        description = "Node.js development environment";
      };

      terraform-v0-15 = {
        path = ./terraform-v0.15;
        description = "Terraform v0.15.x development environment";
      };
    };
  };
}
