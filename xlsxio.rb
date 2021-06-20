# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Xlsxio < Formula
  desc "XLSX I/O - C library for reading and writing .xlsx files"
  homepage ""
  url "https://github.com/brechtsanders/xlsxio/archive/refs/tags/0.2.29.tar.gz"
  sha256 "0b6b4244420e8a2f492d09eae2abd6562c3113c22997673b0f2560bdb06d072f"
  license "MIT"

  depends_on "libzip"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    #system "./configure", "--prefix=#{prefix}", "--with-libzip", "--disable-silent-rules"
    system "make", "PREFIX=#{prefix}", "WITH_LIBZIP=1", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xlsxio`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
