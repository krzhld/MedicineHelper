FROM fedora
LABEL description="clinic/app"
EXPOSE 5000
RUN dnf install python3 python3-pip -y
COPY . /app
WORKDIR /app
RUN pip3 install -r /app/requirements.txt
CMD ["python3","/app/main.py"]
