class Wxmathplot < Formula
  homepage "http://wxmathplot.sourceforge.net"
  url "https://github.com/easior/wxMathPlot.git"

  version "0.1.3"
  
  depends_on "cmake"
  depends_on "wxmac"

  def install


    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_CXX_FLAGS_RELEASE="
      args.delete "-DCMAKE_C_FLAGS_RELEASE="
      args << "-DCMAKE_C_FLAGS_RELEASE=-O3 -march=native"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-O3 -march=native"
      args << "-DBUILD_SHARED_LIBS=TRUE"
      args << "../mathplot"

      system "cmake", *args
      system "make","install"
    end
  end
end
