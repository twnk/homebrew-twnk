class Quocktail < Formula
  desc "Rust CLI for searching through nested directories of markdown files with frontmatter, filtering and displaying the results"
  version "0.1.3"
  on_macos do
    on_arm do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.3/quocktail-aarch64-apple-darwin.tar.xz"
      sha256 "2fbad35055280fcb88bee37b36e0e717ac39bc40960450d0eabaf63787b2ebda"
    end
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.3/quocktail-x86_64-apple-darwin.tar.xz"
      sha256 "6306e55a1a2f6ca1f251b1b3dcfadfe282b2e956072f70b0ae91e1f67aa18086"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.3/quocktail-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "37498dd890a289e669954638b36fa27f3ed1bedae255b0902e9939afb4fb6747"
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
