# keyd
Used to remap keyboard keys.

Should be used in situations where you cannot flash or use a custom keyboard (like laptops).

## Installation
```
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
```

## Configuration
1. Place config to `/etc/keyd/default.conf`
2. `sudo systemctl enable keyd`
3. `sudo keyd reload` (Optional)
