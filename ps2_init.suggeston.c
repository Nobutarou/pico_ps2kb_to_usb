void ps2_init(void)
{
    // （元の初期化処理はそのまま）
    break_pending = false;
    extended_pending = false;
    // ...中略...

    // 🚀 優等生ルートの初期化ハック注入！
    printf("キーボードにリセット（0xFF）を送信するのだ！\n");
    kbd_write_byte(0xFF);

    uint8_t initCode = 0;
    
    while (1) {
        // kbd_ready() を超高速で呼び出し続けて、データが来るのを待つ（while空回り）
        while ((initCode = kbd_ready()) == 0) {
            // PIOのバッファが空の間は、ここでただ待つ
        }

        // 届いたデータ（initCode）を分析するのだ！
        if (initCode == 0xAA) {
            printf("0xAA 受信！キーボードの起動成功なのだ！\n");
            break; // 完璧！ループを抜けて通常処理へ
        } 
        else if (initCode == 0xFA) {
            printf("0xFA (ACK) 受信。本命の 0xAA を引き続き待つリね……\n");
            // 何もしないで、外側の while(1) で次のデータを待つ
        } 
        else {
            // 予期せぬゴミデータが来たら、もう一度リセットを掛け直す（42行目と同じ保険）
            printf("エラーコード 0x%02X 受信。リセットを再送するのだ！\n", initCode);
            kbd_write_byte(0xFF);
        }
    }
}
