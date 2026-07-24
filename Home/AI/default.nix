{
  config,
  pkgs,
  lib,
  llm-agents,
  ...
}:
{
  home.packages =
    (with llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
      claude-code
      antigravity-cli
      mistral-vibe
      copilot-cli
      kimi-code
    ])
    ++ (with pkgs; [
      clang-tools
    ]);
}
