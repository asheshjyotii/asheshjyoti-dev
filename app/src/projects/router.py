from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates

# initializing router

router = APIRouter(prefix="/projects")

# initializing Jinja2 for HTMl return

template = Jinja2Templates(directory="app/templates")

@router.get("/")
def get_projects(request: Request):
    return template.TemplateResponse(request=request, name="projects/home.html")