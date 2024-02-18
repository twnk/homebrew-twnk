class Quocktail < Formula
  desc "Rust CLI for searching through nested directories of markdown files with frontmatter, filtering and displaying the results"
  version "0.1.4"
  on_macos do
    on_arm do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.4/quocktail-aarch64-apple-darwin.tar.xz"
      sha256 "f5b8295195c6330801423bc6a7ab473451223d48499ca15428a7591447b18190"
    end
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.4/quocktail-x86_64-apple-darwin.tar.xz"
      sha256 "b64fbde7fe23c543bc33fcc3b04789668982d45de0cc31629c8c7b5141dce11b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.4/quocktail-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b3dc518c8e8e9709b9ac4f40958a375f2e1abee6b007203189b122d87f0015e1"
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
