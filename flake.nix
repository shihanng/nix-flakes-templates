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
    };
  };
}
