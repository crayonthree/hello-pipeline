FROM python:3.9-slim
COPY abhiroop.py .
CMD ["python", "abhiroop.py"]