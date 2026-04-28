
FROM python:3.11


WORKDIR /code


COPY --from=ghcr.io/astral-sh/uv:0.8.15 /uv /uvx /bin/


COPY pyproject.toml uv.lock ./

RUN uv sync --locked --no-install-project


COPY ./app  ./app


RUN uv sync --locked



CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]