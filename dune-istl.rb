# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class DuneIstl < Formula
  homepage "http://www.dune-project.org/"
  url "http://www.dune-project.org/download/2.3.1/dune-istl-2.3.1.tar.gz"
  version "2.3.1"
  sha256 "fcc754ce7d8b21d6b2fe3ef66a5d1172b52afd8679ef6b2a4f916312491c36fa"
  
  depends_on "cmake"
  depends_on "libx11" # if your formula requires any X11/XQuartz components
  depends_on "easior/wunderland/dune-common"
  
  def install

    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_CXX_FLAGS_RELEASE="
      args.delete "-DCMAKE_C_FLAGS_RELEASE="
      args << "-DCMAKE_C_FLAGS_RELEASE=-O3 -march=native"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-O3 -march=native"
      args << "-DBUILD_SHARED_LIBS=TRUE"
      args << ".."

      system "cmake", *args
      system "make","install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test dune-istl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
