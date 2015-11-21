class DuneAlugrid < Formula
  homepage "http://users.dune-project.org/projects/dune-alugrid"
  url "https://github.com/bempp/dune-alugrid.git"

  version "2.3-dev"

  depends_on "cmake"
  depends_on "easior/wunderland/dune-grid"

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
