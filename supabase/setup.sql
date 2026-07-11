-- 빙글 번아웃 체크 — Supabase 초기 설정
-- Supabase Dashboard > SQL Editor 에서 실행하세요.

create table if not exists assessment_results (
  id               bigserial primary key,
  created_at       timestamptz default now() not null,
  symptom_total    int         not null check (symptom_total between 0 and 100),
  severity         text        not null,
  emotion_temp     numeric(4,1) not null,
  symptom_scores   jsonb       not null default '{}',
  cause_scores     jsonb       not null default '{}',
  top_cause        text        not null,
  answers          jsonb       not null default '[]'
);

-- RLS: 익명 사용자는 insert만 허용, 조회 불가
alter table assessment_results enable row level security;

create policy "anon insert only"
  on assessment_results
  for insert
  to anon
  with check (true);
