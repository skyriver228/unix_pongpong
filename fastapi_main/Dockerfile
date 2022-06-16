FROM python:latest

COPY ./api /fastapi_main

WORKDIR /api

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["uvicorn", "flow:app", "--host", "0.0.0.0", "--port", "8080"]
