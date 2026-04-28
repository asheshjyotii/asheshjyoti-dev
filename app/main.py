from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
from app.src.porfolio.router import  router as portfolio_router
from app.src.projects.router import  router as projects_router

# creating fastapi app instance
app = FastAPI(title="Ashesh's Portfolio")

# including all routers
app.include_router(portfolio_router)
app.include_router(projects_router)



