# 빙글 번아웃 체크 🌡️

MBI·BAT 혼합형 **증상 점수**(감정적 소진 · 비인격화 · 개인 성취감 저하 · 인지 저하 · 정서적 통제력 저하)와 **원인 점수**(업무량/시간 압박 · 보상/인정 부족 · 관계/사회적 지지 부족 · 회복 자원 부족)를 동시에 산출하는 번아웃 통합 검사 웹사이트입니다.

검사 결과는 Supabase에 **익명으로 저장**됩니다.

## 🚀 배포 방법 (5분)

### 1. Supabase 설정
1. [supabase.com](https://supabase.com) 에서 새 프로젝트 생성
2. **SQL Editor** 에서 `supabase/setup.sql` 내용을 붙여넣고 Run
3. **Settings > API** 에서 `Project URL`과 `anon public` 키 복사
4. 이 repo의 `config.js` 에 두 값을 붙여넣고 커밋

### 2. GitHub Pages 켜기
1. repo **Settings > Pages**
2. Source: `Deploy from a branch` → Branch: `main` / `/ (root)` → Save
3. 1~2분 후 `https://chaejun12.github.io/burnout-check-tool/` 에서 접속 가능

## 📊 채점 구조
- 응답: 최근 2주 기준, 0~4점 5점 척도 (30문항)
- 각 하위 척도를 0~100점으로 정규화, 증상 총점은 5개 척도 평균
- 심각도: 안정(0~24) / 주의(25~49) / 경고(50~74) / 위험(75~100)
- 감정 온도 = 36.5°C × (1 − 증상점수/100)
- 역채점 문항: C3(보람), C4(문제 처리), 보상 B3(완벽 수행), 관계 1(도움 요청 가능), 회복 2·3(퇴근 후 활동) — `index.html`의 `rev:true`로 표시

## 🔒 데이터 & 프라이버시
- RLS로 익명 사용자는 **insert만** 가능, 조회 불가
- 수집 항목: 점수·응답값·시각만 (개인 식별 정보 없음)
- 본 검사는 선별 도구이며 의학적 진단을 대체하지 않습니다
