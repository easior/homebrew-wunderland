class DuneFoamgrid < Formula
  homepage "http://users.dune-project.org/projects/dune-foamgrid"
  url "https://github.com/bempp/dune-foamgrid.git", :using => :git

  version "2.3-dev"

  depends_on "cmake"
  depends_on "easior/wunderland/dune-grid"

#  patch :p2 do
#    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_foamgrid_cmake.patch"
#    sha256 "fd3e3e5622a0d4e25dca971f6857bb0148edcc1848babe419043df92d8f1b3cb"
#  end

  def install

    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_CXX_FLAGS_RELEASE="
      args.delete "-DCMAKE_C_FLAGS_RELEASE="
      args << "-DCMAKE_C_FLAGS_RELEASE=-O3 -march=native"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-O3 -march=native"
      args << "-DBUILD_SHARED_LIBS=TRUE"
      args << "-DBUILD_TESTING=OFF"
      args << ".."

      system "cmake", *args
      system "make","install"
    end
   end
end
