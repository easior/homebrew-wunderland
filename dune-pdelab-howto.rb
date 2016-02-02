class DunePdelabHowto < Formula
  desc ""
  homepage "http://dune-project.org/"
  url "http://dune-project.org/download/pdelab/2.0/dune-pdelab-howto-2.0.0.tar.xz"
  version "2.0.0"
  sha256 "681deb45f649df771b4cd8ec05301645098d6ac9f668e5170021079c1213e1b9"

  depends_on "cmake"
  depends_on "easior/wunderland/dune-pdelab"
  
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
end
