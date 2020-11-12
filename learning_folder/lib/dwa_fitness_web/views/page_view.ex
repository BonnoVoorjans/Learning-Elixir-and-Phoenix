defmodule DwaFitnessWeb.PageView do
  use DwaFitnessWeb, :view

   def render("index.json", %{pages: pages}) do #gets called from render calls in controller. Pattern matching for customizable rendering
    %{data: render_many(pages, DwaFitnessWeb.PageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, DwaFitnessWeb.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end
end
