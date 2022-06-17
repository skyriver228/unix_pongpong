# Unix_pongponglab

# Draft: AI based Keyword density analysis

<aside>
<img src="./readme_source/Layers.png" width="40px" /> Draft는 AI와 키워드 밀도 분석을 기반으로 논문(nature comunication 한정)을 분석해주는 툴로 사용자가 읽어야 하는 부분에 대한 우선순위 선정에 도움을 주는 웹 서비스 입니다.

</aside>

---

<aside>
🚨 **notice)** 시간 및 서버 상의 이슈(docker설치 불가)로 로컬에서 돌아가던 Api들이 배포되지 못했습니다. 다만 [아래의 부분](https://www.notion.so/Unix_pongponglab-532e775e875e45d98dc9d22e13e0da20)을 통해 실제 url을 기반으로 논문을 분석하는 과정을 mainflow는 코드상에서 테스트 해볼 수 있습니다!

</aside>

```
<img width="80%" src="https://user-images.githubusercontent.com/16822641/109461495-913fc480-7aa5-11eb-9d0e-aff762669f98.gif"/>
```

## 제작 동기

정보 전달 글을 분석할때 가장 좋은 방법은 핵심어를 기준으로 분석하는 것이라 생각합니다. 하지만 현재까지 빠른 논문 분석을 위해서는 관심 및 목적에 따른 핵심어 설정 후, 검색 기능을 통해 문단 하나하나를 읽어보는 방법밖에 없었습니다. 이에 Draft 는 키워드 검색 뿐만이 아니라 키워드의 등장 빈도에 해당하는 데이터도 시각화하여 사용자에게 제공하여 사용자가 읽어야 하는 부분에 대한 우선순위 선정에 도움을 주고자 합니다.

**[구성 flow]** **[figma](https://www.figma.com/file/gNznrSMLdDRU0qhggi3DFM/Project_UNIX)-Draft?node-id=0%3A1)** 통해 확인가능

## Main flow test 방법

### 가상환경 생성 및 필요 requirment 설치

- 3.8버전도 가능하지만, 3.9버전을 권장합니다.

```markdown
$ conda create -n <venv_name> python=3.9
$ conda activate <venv_name>
$ pip install -r requirements.txt
```

### fastapi_main에서 실제로 main flow 확인해보기

- 가상환경을 켜둔 상태로 2개의 터미널을 기반으로 확인하는 것이 좋습니다.
- api 통신 확인을 위해 httpie를 사용하였습니다.

```markdown
$ cd fastapi_main
$ python flow.py
```

**[AI 기반 keyword extraction]**

- 분석하고 싶은 논문을 nature communication에서 찾아 url 형태로 입력해줍니다.
- 결과는 **`keyword_extract.json`**이라는 명칭의 json파일로 저장됩니다. ([예시 결과](https://www.notion.so/Unix_pongponglab-532e775e875e45d98dc9d22e13e0da20))
    - 다만, mainflow 확인의 편의를 위해 article은 **`article.txt`**파일로 추가 저장됩니다.

```markdown
$ cd fastapi_main
$ 
```

**[keyword density data]**

- **`article.txt`**에서 자동으로 text는 가져오지만 키워드는 사용자가 3개를 제안해야 합니다.
- 결과는 **`keyword_density.json`**이라는 명칭의 json파일로 저장됩니다. ([예시 결과](https://www.notion.so/Unix_pongponglab-532e775e875e45d98dc9d22e13e0da20))

```markdown
$ cd fastapi_main
$ 
```

### 예시 결과

**[AI 기반 keyword extraction]**

```json

```

**[keyword density data]**

```json

```

## 변경사항

### **[AI]**

- 기존의 Abstract만을 가지고 진행한 부분을 결과 발표 이후, 여러번의 실험결과, 가장 좋은 결과가 나온 reference 등을 제외한 본문만을 기반으로 분석을 진행하였습니다

### **[기술 스텍]**

- react → flutter(react대신 flutter web을 기반으로 작성되었습니다.)

### **[로그인, 회원가입]**

- 개발 이슈로 인해 해당 부분을 향후 개발 사항으로 미루고, 원래 있던 버튼은 **`github routing`** 버튼으로 변경하였습니다.

### **[미니맵]**

- flutter로 기술 스택이 변경되며, front상 미니맵 구현에 많은 에러 사항을 겪어 후속개발로 진행될 예정입니다.

## 향후 개발 진행사항

- [ ]  fast api 배포
- [ ]  로그인, 회원가입 배포
- [ ]  minimap 기능 및 density graph 논문과의 배치 정확도 개선
- [ ]  nature communication 이외 데이터 대은
- [ ]  pdf 데이터 대응
