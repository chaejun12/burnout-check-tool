-- 빙글 번아웃 체크 — Supabase 테이블 설정
-- Supabase 대시보드 > SQL Editor 에 붙여넣고 Run 하세요.

create table public.assessment_results (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  symptom_total int not null,          -- 증상 총점 (0~100)
  severity text not null,              -- 안정/주의/경고/위험
  emotion_temp numeric,                -- 감정 온도 (°C)
  symptom_scores jsonb not null,       -- 하위 척도 5개 점수
  cause_scores jsonb not null,         -- 원인 4개 점수
  top_cause text,                      -- 최상위 원인
  answers jsonb not null               -- 원문항 응답 (0~4) 30개
);

-- RLS: 익명 사용자는 '쓰기만' 가능, 읽기는 불가 (응답자 프라이버시 보호)
alter table public.assessment_results enable row level security;

create policy "anon_insert_only"
  on public.assessment_results
  for insert
  to anon
  with check (true);

-- 데이터 조회는 Supabase 대시보드(Table Editor) 또는
-- service_role 키를 쓰는 서버 환경에서만 하세요.
