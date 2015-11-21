# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class DunePdelab < Formula
  desc ""
  homepage "http://dune-project.org/"
  url "http://dune-project.org/download/pdelab/2.0/dune-pdelab-2.0.0.tar.bz2"
  version "2.0.0"
  sha256 "f34dddc914a5cf6581e9ce067e04ba6bf8f495044ec1736d83ad6a7b2605a4a7"

  depends_on "cmake"
  depends_on "easior/wunderland/dune-common"
  depends_on "easior/wunderland/dune-geometry"
  depends_on "easior/wunderland/dune-grid"
  depends_on "easior/wunderland/dune-istl"
  depends_on "easior/wunderland/dune-typetree"
  
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
    # were more thorough. Run the test with `brew test dune-pdelab`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
