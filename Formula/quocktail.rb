class Quocktail < Formula
  desc "Rust CLI for searching through nested directories of markdown files with frontmatter, filtering and displaying the results"
  version "0.1.6"
  on_macos do
    on_arm do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.6/quocktail-aarch64-apple-darwin.tar.xz"
      sha256 "ce4e8b853529ffff043dd8d9a97d9bc2da46daeae0f9b89fdd77eecb2770ab87"
    end
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.6/quocktail-x86_64-apple-darwin.tar.xz"
      sha256 "fa4445712a19d65bbf2b6bc60954cf6f14af2248f9f413640433f5063cfc42db"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/twnk/quocktail/releases/download/v0.1.6/quocktail-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5c8cb7f29c0596d42af9382ec16230c293bfdb3333a863d871dee7bfa33a28c3"
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
