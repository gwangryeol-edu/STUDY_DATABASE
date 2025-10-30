### 데이터 베이스 시험 유형: 서로 관계 어떻게 했는지 어떻게 접근하는지

트랜젝션: 읽기 전용에선 쓸모없음, 오로지 수정, 삭제에서 사용

LLM(Large Language Models): 대규모 언어 모델(LLM)은 방대한 양의 데이터로 사전 학습된 초대형 [딥 러닝](https://aws.amazon.com/what-is/deep-learning/) 모델

MCP**(Model Context Protocol): AI 시대에 등장한 새로운 오픈소스 통신 표준으로, AI 에이전트가 외부 도구나 데이터 소스에 연결하여 실제 작업을 수행할 수 있게 돕는 기술**

![Screenshot 2025-10-28 at 11.06.41 AM.png](attachment:7081a951-35e5-4dc3-8873-85ede66b7d92:Screenshot_2025-10-28_at_11.06.41_AM.png)

### zshrc

터미널을 실행을 시키는 순간 정보를 불러오는 설정 값

1. 숨긴파일 보기 : shift + command + .(점)
2. 텍스트 편집기로 편집
3. 아래 내용 적기(이미 작성된 내용 무시하고 맨 아래에 적기)
    
    export ASDF='test'
    export MYSQL_HOST="127.0.0.1"
    export MYSQL_PORT="3306"
    export MYSQL_DATABASE="sakila"
    export MYSQL_USER="root"
    export MYSQL_PASSWORD="1234"
    

1. 터미널 진입 아래 명령어 입력해서 출력 확인
echo $MYSQL_PASSWORD
>1234
echo $MYSQL_DATABASE
>sakila

⇒ 자연어를 sql로 번역해서 자동으로 통역

[teminal: gemini]

 /mcp list
>

![Screenshot 2025-10-28 at 11.50.30 AM.png](attachment:3c050609-705c-4025-8135-8ccfe3e93402:Screenshot_2025-10-28_at_11.50.30_AM.png)

지금 내가 사용가능한 테이블 목록을 알려줘

>

![Screenshot 2025-10-28 at 11.51.32 AM.png](attachment:e89c8876-eb60-4fc3-b7f1-8ab8ea6e22ce:Screenshot_2025-10-28_at_11.51.32_AM.png)

world 데이터 베이스에 어떤 테이블이 있는지 조회하고 그들간의 관계를 설명해줘. 조회라기 위해 사용한 sql 쿼리문도 알려줘

>

![Screenshot 2025-10-28 at 11.52.37 AM.png](attachment:053397fb-c146-4606-9c51-eb1d3639e521:Screenshot_2025-10-28_at_11.52.37_AM.png)

### 코호트, 리텐션, 퍼널

코호트

**특정 기간 동안 공통된 특성이나 경험을 갖는 사용자 집단**

리텐션

**사용자가 특정 제품이나 서비스를 처음 사용한 후, 일정 기간이 지난 뒤에도 계속해서 사용하는 비율인 '리텐션율(재사용률)'을 측정하고 분석하는 과정**

퍼널

**사용자가 최초 유입부터 최종 목표(구매, 회원가입 등)에 도달하기까지의 과정을 단계별로 시각화하여, 각 단계에서 발생하는 이탈률과 전환율을 파악하는 분석 기법**