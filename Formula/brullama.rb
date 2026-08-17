class Brullama < Formula
  desc "Local-first model runtime and CLI"
  homepage "https://github.com/ollama/ollama"
  license "MIT"
  head "https://github.com/ollama/ollama.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X=github.com/ollama/ollama/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/runner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brullama --version")
  end
end
