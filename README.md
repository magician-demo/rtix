![image](https://user-images.githubusercontent.com/75147824/118142867-5c54d400-b43d-11eb-960f-1b75e952b3ac.png)

# RTIX - 活動查詢 | 售票服務 | 舉辦活動

參考國內知名活動平台 ACUPASS 與 KKTIX, RTIX 以 Rails 為基底, 致力打造一個由活動查詢、票券購買、活動創建至活動舉辦的一站式活動服務平台。

# Feature

- 圖像化購票選位介面, 即時更新最新座位情況
- 串接國內知名第三方金流服務, 提供安全且便捷的付款機制
- 串接全球知名社交平台帳號, 允許多途徑的會員註冊與登入機制
- 人性化 UI/UX 風格設計, 最佳化視覺呈現
- 完備的後台管理機制, 票券/活動訊息圖像化清楚呈現

# Architecture (機動性調整)

![image](https://user-images.githubusercontent.com/75147824/118145231-fae23480-b43f-11eb-90e8-b41363d3bbd6.png)
圖示連結： https://whimsical.com/rtix-fc-0509-UXH11eyGThovE8BAmfA8dE

# Version

- Ruby 版本：2.7.2
- Rails 版本：6.1.3.2
- PostgreSQL 版本：13.2

# Member

- [Hoga](https://github.com/hogaga)
- [Robert.C](https://github.com/Robeeerto)
- [Skye](https://github.com/skyee2021)
- [SunWei Chou](https://github.com/SunWeiChou)
- [Weij28](https://github.com/Weij28)
- [FriedrichChiu](https://github.com/FriedrichChiu)

# Pull 後的操作流程！

- 切換到自己的分支把拉下來的分支 rebase (若有衝突請到 discord 公頻發問)
- $ yarn
- $ bundle install
- $ rails db:migrate
- $ rails hotwire:install
- $ foreman s -f Procfile.dev-> 就可以啟動了唷！
