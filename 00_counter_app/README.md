## DemoのカウンターアプリをRiverpod + StateNotifierで書き換え

### ライブラリ
- flutter_hooks
- hooks_riverpod

### 目的
RiverpodとStateNotiferの挙動を確認するため、Flutterプロジェクト生成時に作られる、カウンターアプリを書き換えて最適化してみる。

### 結果
RiverpodとStateNotifierを導入することで、UIとロジックを分離することができ、
Flutter Performanceにて以下の様な最適化を簡単に行うことを確認できた。

| 環境 | 表示 | Flutter Performance |
|:--:|:--:|:--:|
| Demo | <img width="100" src="https://user-images.githubusercontent.com/8654605/96373000-afff8780-11a4-11eb-9172-39c3d8f0b556.png" /> | <img width="200" src="https://user-images.githubusercontent.com/8654605/96372682-e936f800-11a2-11eb-82f6-4d454bf8d15c.png" /> |
| Riverpod<br>+<br>StateNotifier | <img width="100" src="https://user-images.githubusercontent.com/8654605/96372677-e5a37100-11a2-11eb-8c7e-1485ce576832.png" /> | <img width="200" src="https://user-images.githubusercontent.com/8654605/96372681-e936f800-11a2-11eb-97f7-aeeef0907d71.png" /> |
