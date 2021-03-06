{ stdenv, lib, fetchzip, libtool, pkgconfig, ncurses }:

stdenv.mkDerivation rec {
  name = "libtermkey-${version}";

  version = "0.22";

  src = fetchzip {
    url = "http://www.leonerd.org.uk/code/libtermkey/libtermkey-${version}.tar.gz";
    sha256 = "02dks6bj7n23lj005yq41azf95wh3hapmgc2lzyh12vigkjh67rg";
  };

  makeFlags = [ "PREFIX=$(out)" ]
    ++ stdenv.lib.optional stdenv.isDarwin "LIBTOOL=${libtool}/bin/libtool";

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ libtool ncurses ];

  meta = with lib; {
    description = "Terminal keypress reading library";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
