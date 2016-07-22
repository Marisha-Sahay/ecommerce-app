Rails.application.routes.draw do
  get "/all_product", to: "products#all_product"
end
