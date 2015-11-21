class DuneCommon < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-common-2.3.1.tar.gz"
  sha256 "040cd3811d195631cfa99fab43443d69c1b83f82737b0cd98e4f330ec84051f5"

  depends_on "cmake"
  depends_on "doxygen"

  patch :p1 do
    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_common_cmake.patch"
    sha256 "44d048d3c1e2da5f6820da963d01f66897b802c6a3a48b34182cfa3251e78d67"
  end

  patch :p1 do
    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_disable_fortran.patch"
    sha256 "2ee5fb8b51ea7606b03c0abc0631148dac0b879784b2e67e9bb29f3f2f3e44bc"
  end

  patch :p0 do
    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_macros.patch"
    sha256 "e7819c2ceed80417a9da4fafaaed61cd7122710f512bff3bac25f1d2917d947c"
  end

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
