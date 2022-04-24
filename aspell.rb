class Aspell < Formula
  desc "Spell checker with better logic than ispell"
  homepage "http://aspell.net/"
  url "https://ftp.gnu.org/gnu/aspell/aspell-0.60.8.tar.gz"
  mirror "https://ftpmirror.gnu.org/aspell/aspell-0.60.8.tar.gz"
  sha256 "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
  license "LGPL-2.1-only"

  bottle do
    rebuild 1
    sha256 arm64_monterey: "d75d3b4e2929123244786e9adb7ff335ec75943617e7dbd855d71c7ce3035173"
    sha256 arm64_big_sur:  "bdd761d4454523f1bc8c0adba2db1a23c215c01371e348cd162b573347791159"
    sha256 monterey:       "91f9e3083f86a059d0db046aa78e3ddf95a3c6cf531c982b7ca470dd0e57db3b"
    sha256 big_sur:        "abf04f9f474e21d070e22667204cd122e7e099e90e60110dc7639fdaa5f5a66f"
    sha256 catalina:       "86b7d31eff12742ccb73464c088c8313998bd4c1e37f108754f936d51b6f49dd"
    sha256 mojave:         "aeded9b9861145353ad13bbf85772f23e556fe6dc0b263beebd555cf19762197"
    sha256 x86_64_linux:   "5154c4a1e76b1f9ab21325d442cd9eaf80b83314792142ff837f84bcfb8cbb4a"
  end

  uses_from_macos "ncurses"

  resource "en" do
    url "https://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-2018.04.16-0.tar.bz2"
    mirror "https://ftpmirror.gnu.org/aspell/dict/en/aspell6-en-2018.04.16-0.tar.bz2"
    sha256 "f11071e74b0c0753f4afabf024941a5c3a96bafe3879211ebd47bc34e76fbd2f"
  end

  resource "fr" do
    url "https://ftp.gnu.org/gnu/aspell/dict/fr/aspell-fr-0.50-3.tar.bz2"
    mirror "https://ftpmirror.gnu.org/aspell/dict/fr/aspell-fr-0.50-3.tar.bz2"
    sha256 "f9421047519d2af9a7a466e4336f6e6ea55206b356cd33c8bd18cb626bf2ce91"
  end

  resource "uk" do
    url "https://ftp.gnu.org/gnu/aspell/dict/uk/aspell6-uk-1.4.0-0.tar.bz2"
    mirror "https://ftpmirror.gnu.org/aspell/dict/uk/aspell6-uk-1.4.0-0.tar.bz2"
    sha256 "35f9a7e840c1272706bc6dd172bc9625cbd843d021094da8598a6abba525f18c"
  end

  # const problems with llvm: https://www.freebsd.org/cgi/query-pr.cgi?pr=180565&cat=
  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"

    ENV.prepend_path "PATH", bin

    resources.each do |r|
      r.stage do
        system "./configure", "--vars", "ASPELL=#{bin}/aspell", "PREZIP=#{bin}/prezip"
        system "make", "install"
      end
    end
  end

  test do
    assert_equal "worrd", pipe_output("#{bin}/aspell list -d en_US", "misspell worrd").strip
  end
end

__END__
diff --git a/interfaces/cc/aspell.h b/interfaces/cc/aspell.h
index 9c8e81b..2cd00d4 100644
--- a/interfaces/cc/aspell.h
+++ b/interfaces/cc/aspell.h
@@ -237,6 +237,7 @@ void delete_aspell_can_have_error(struct AspellCanHaveError * ths);
 /******************************** errors ********************************/


+#ifndef __cplusplus
 extern const struct AspellErrorInfo * const aerror_other;
 extern const struct AspellErrorInfo * const aerror_operation_not_supported;
 extern const struct AspellErrorInfo * const   aerror_cant_copy;
@@ -322,6 +323,7 @@ extern const struct AspellErrorInfo * const   aerror_missing_magic;
 extern const struct AspellErrorInfo * const   aerror_bad_magic;
 extern const struct AspellErrorInfo * const aerror_expression;
 extern const struct AspellErrorInfo * const   aerror_invalid_expression;
+#endif


 /******************************* speller *******************************/
