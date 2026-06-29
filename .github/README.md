<h1 align="center">
   <img src="assets/nixos-logo.png" width="100px" /> 
   <br>
      My NixOS system
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/Leorevoir/NixOS/stargazers">
            <img src="https://img.shields.io/github/stars/Leorevoir/NixOS?color=F5BDE6&labelColor=303446&style=for-the-badge&logo=starship&logoColor=F5BDE6">
         </a>
         <a href="https://github.com/Leorevoir/NixOS/">
            <img src="https://img.shields.io/github/repo-size/Leorevoir/NixOS?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=NixOS&logoColor=white&label=NixOS&labelColor=303446&color=91D7E3">
         </a>
         <a href="https://github.com/Leorevoir/NixOS/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

## Install

First, clone the repo:
```bash
git clone git@github.com/Yutsuna/NixOS
```
Then go to the root of the repo
```bash
cd NixOS
```
Edit `Config.nix` with your own informations

Once that done, build the OS:
```bash
git add -A && sudo nixos-rebuild switch --flake ~/NixOS/#NixOS
```

## Features

I use Secrets ! So every API | Secrets keys are fully encrypted before being pushed.
If you want to use secrets too:

First create a **secret** key:
```bash
nix-shell -p ssh-to-age --run 'cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'
```

Then edit your secret 

```bash
nix-shell -p sops --run 'sops Secrets/Secrets.yaml'
```

---

## License

Yutsuna 2026
