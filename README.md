# deploy-1box-vsan のサンプル コンフィグ

このツールで利用するコンフィグのサンプル。
https://github.com/gowatana/deploy-1box-vsan

labs/lab-vc-01_lab-cluster-01.ps1 から、おもに3種類のコンフィグを読み込む。
1. vCenter ログイン情報
2. ラボのインフラとなるvSphereの情報
3. ラボとしてして利用するvSphereの情報（自動構築対象のネスト環境）

## ファイルの配置

| ディレクトリ | 用途 |
| --- | --- |
| labs/01_vcenter-login | vCenterログイン情報 |
| labs/02_base-vsphere | ネスト外側のvSphere定義 |
| labs/03_nest-vsphere | ネスト内側のvSphere定義 |
