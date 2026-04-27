from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates


# initializing router

router = APIRouter()

# initializing Jinja2Templates

templates = Jinja2Templates(directory="templates")

# creating HTML return endpoints

@router.get("/")
def get_portfolio(request : Request):
    return templates.TemplateResponse(request=request, name="portfolio/home.html")