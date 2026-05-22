<h1 style="margin-bottom:0;">nixos</h1>

<br>Мой конфиг NixOS, Home Manager и прочих Nix-модулей.</br>

<h2 style="margin-bottom:0;">Хосты</h2>

- <b>nyx:</b> Домашний компьютер. Видеокарта(ы): NVIDIA RTX 3070, NVIDIA GTX 1650; CPU: AMD Ryzen 5 5600X; 36GB RAM (DDR4).
- <b>callisto:</b> Рабочий (основной) ноутбук. Видеокарта(ы): NVIDIA RTX 3050 Mobile, Radeon RX Vega 8 (iGPU); CPU: AMD Ryzen 7 5800H; 16GB RAM (DDR4).

<h2 style="margin-bottom:0;">Архитектурные принципы (W.I.P.)</h2>

- Проще → лучше, однако иногда принцип "понятней (логичней) → лучше" преобладает.
- Чем менее многоуровневой получается конфигурация, тем лучше.
- Ветвление на основе собственных опций (<code>config.ndsl</code> && <code>ndsl</code>) предпочтительней ветвления посредством создания <b>host-specific</b> <code>.nix</code> конфигурационных файлов (однако, такой механизм <i>также представлен</i> и используется, например, для host-specific файлов <code>hardware-configuration.nix</code>).

<h2 style="margin-bottom:0;">Язык конфигурации <code>ndsl</code></h2>
W.I.P.
