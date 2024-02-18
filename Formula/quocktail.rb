class Quocktail < Formula
  desc "Rust CLI for searching through nested directories of markdown files with frontmatter, filtering and displaying the results"
  version "0.1.5"
  on_macos do
    on_arm do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.5/quocktail-aarch64-apple-darwin.tar.xz"
      sha256 "ca96b7cb8eec2072f44b8f82fbe80a2a3137b66d4adc6668f0127e41b2cf640a"
    end
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.5/quocktail-x86_64-apple-darwin.tar.xz"
      sha256 "18358610f0602227bec1a67b407d87fc8890bb3e4461ab163adf6c594cb2b563"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.5/quocktail-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "39745fd22e832673a2811c42b979a21dca9bb0193035b69ab48811dc9dca0b08"
    end
  end
  license "GPL-3.0-or-later"

  def install
    on_macos do
      on_arm do
        bin.install "quocktail"
      end
    end
    on_macos do
      on_intel do
        bin.install "quocktail"
      end
    end
    on_linux do
      on_intel do
        bin.install "quocktail"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
