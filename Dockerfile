
FROM python:3.11


WORKDIR /code


COPY --from=ghcr.io/astral-sh/uv:0.8.15 /uv /uvx /bin/


COPY pyproject.toml uv.lock ./

RUN uv sync --locked --no-install-project


COPY ./app  ./app



# Install curl, download Tailwind standalone binary, make it executable, and build CSS once
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /code/app/tailwindcss \
    && curl -L "https://github.com/tailwindlabs/tailwindcss/releases/download/v4.2.4/tailwindcss-linux-x64" -o /code/app/tailwindcss/tailwindcss \
    && chmod +x /code/app/tailwindcss/tailwindcss \
    && /code/app/tailwindcss/tailwindcss -i /code/app/static/css/input.css -o /code/app/static/css/output.css


RUN uv sync --locked



CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]