{
  pkgs,
  llm-agents,
  ...
}:
{
  home.packages =
    (with llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
      antigravity-cli
      mistral-vibe
      copilot-cli
      opencode
      qoder-cli-cn
    ]);
}
