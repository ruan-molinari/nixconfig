{
  pkgs,
  inputs,
  ...
}: {
  services.keyd = {
    enable = true;

    keyboards = {
      razerTartarus = {
        ids = ["1532:0244"]; 
        settings = {
          main = {

            tab = "q";
            q = "w";
            w = "e";
            e = "r";
            r = "t";

            capslock = "a";
            a = "s";
            s = "d";
            d = "f";
            f = "g";

            shift = "z";
            z = "x";
            x = "c";
            c = "v";

            control = "alt";
          };
        };
      };
    };
  };
}
