class Wxsqlite3 < Formula
  desc "wxSQLite3 - SQLite3 database wrapper for wxWidgets (including SQLite3 encryption extension)"
  homepage "http://utelle.github.io/wxsqlite3"
  url "https://github.com/utelle/wxsqlite3/archive/refs/tags/v4.7.3.tar.gz"
  sha256 "f03af537de074119199d4e7c9082290a07fcf37099b054b63e1ea42fc1c4fa83"
  license "LGPL-3.0+"

  depends_on "autoconf" => :build
  depends_on "sqlite3"
  depends_on "wxmac"
  
  def install
    system "./autoreconf"
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test wxsqlite3`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
