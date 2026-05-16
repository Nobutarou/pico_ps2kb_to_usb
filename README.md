# これは何

オリジナルはこちらです。
https://github.com/rowol/picow_ps2kb_to_ble_usb

こちらは pico w を使って Bluetooth にも対応してますが、pico w が microB なのが嫌なので、秋
月の RP2040 マイコンボードキット (Pico 相当) で動かせるように、しようとしています。

オリジナルの README.md はこちらです。
[README.org.md](./README.org.md)

# 注意

- まだ検討してるだけで、実際の動作は不明です。
- 自分のことで精一杯です。
  - 参考にしてもらえたら嬉しいですが、Issue とか Commit とかは送られても対処できません。

# 対象キーボードとチューニング

- Justy JKB-89S 
- Caps lock は 左田キー
  - オリジナルは、「何もしない」。たぶん嫌いなんだと思います。
- JIS 専用キーを追加

# 変更対象のソース

- [CMakeLists.txt](./CMakeLists.txt) を書き換えて USB 対応、Pico 対応をする
- [ps2kbd-lib/ps2.c](./ps2kbd-lib/ps2.c) で、PS/2 スキャンコードと HIS コードの対応を作る
